/*
https://pub.dev/packages/webview_flutter
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Webview5Page extends StatefulWidget {
  const Webview5Page({super.key});

  @override
  State<Webview5Page> createState() => _Webview5PageState();
}

class _Webview5PageState extends State<Webview5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  final String htmlString = '''
<html>
<head>
    <title>Communicate from Flutter to Webview</title>
</head>
<body>
<div>Communicate from Flutter to Webview</div>
<div id="text-change">This text will change if you pressed the FAB Button</div>
<script type="text/javascript">
    function communicateFromFlutter(newstring) {
        document.getElementById("text-change").innerHTML = newstring;
    }
</script>
</body>
</html>
''';

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
            //debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            setState(() {
              _loading = false;
            });
            //debugPrint('Page finished loading: $url');
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
      ..loadHtmlString(htmlString);

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
      body: Stack(
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          _controller.runJavaScript(
            'communicateFromFlutter("Hiii, this text is <strong>changed</strong>")',
          );
        },
      ),
    );
  }
}
