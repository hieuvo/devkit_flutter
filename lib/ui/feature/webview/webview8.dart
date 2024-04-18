/*
https://pub.dev/packages/webview_flutter
*/
import 'dart:io';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Webview8Page extends StatefulWidget {
  const Webview8Page({super.key});

  @override
  State<Webview8Page> createState() => _Webview8PageState();
}

class _Webview8PageState extends State<Webview8Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  final String _lookupUrl = 'ijtechnology.net';
  bool connectionStatus = true;

  Future _checkConnection() async {
    try {
      final result = await InternetAddress.lookup(_lookupUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connectionStatus = true;
      }
    } on SocketException catch (e) {
      debugPrint('e : $e');
      connectionStatus = false;
    }
  }

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            setState(() {
              _loading = false;
            });
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://ijtechnology.net/products/devkit'));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: FutureBuilder(
        future: _checkConnection(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (connectionStatus == true) {
            return PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) {
                if (didPop) {
                  return;
                }
                _onWillPop(context);
              },
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  (_loading)?Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ):const SizedBox.shrink(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('No Internet Connection / Custom Error Screen'),
            );
          }
        }
      ),
    );
  }

  void _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}
