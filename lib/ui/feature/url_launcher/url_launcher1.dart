/*
https://pub.dev/packages/url_launcher
Add code on Android Manifest.xml for Android 11 (API 30)

Add code to info.plist for iOS
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>https</string>
  <string>http</string>
</array>
*/
import 'dart:async';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher1Page extends StatefulWidget {
  const UrlLauncher1Page({super.key});

  @override
  State<UrlLauncher1Page> createState() => _UrlLauncher1PageState();
}

class _UrlLauncher1PageState extends State<UrlLauncher1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'URL Launcher 1 - Website',
                  desc: 'This is the example of URL Launcher to website'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Launch In Browser',
                    onPressed: (){
                      _launchInBrowser('https://ijtechnology.net/products/devkit');
                    }
                ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Launch in app',
                    onPressed: (){
                      _launchInWebViewOrVC('https://ijtechnology.net/products/devkit');
                    }
                ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Launch in app (DOM storage OFF)',
                  onPressed: (){
                    _launchInWebViewWithoutDomStorage('https://ijtechnology.net/products/devkit');
                  }
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Launch in app (JavaScript OFF)',
                  onPressed: (){
                    _launchInWebViewWithoutJavaScript('https://ijtechnology.net/products/devkit');
                  }
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Launch a universal link in a native app, fallback to Safari.(Youtube)',
                  onPressed: (){
                    _launchUniversalLinkIos('https://ijtechnology.net/products/devkit');
                  }
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Launch in app + close after 5 seconds',
                  onPressed: (){
                    _launchInWebViewOrVC('https://ijtechnology.net/products/devkit');
                    Timer(const Duration(seconds: 5), () {
                      closeInAppWebView();
                    });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    Uri urlUri = Uri.parse(url);
    if (!await launchUrl(
      urlUri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    Uri urlUri = Uri.parse(url);
    if (!await launchUrl(
      urlUri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  // javascript function will not work
  Future<void> _launchInWebViewWithoutJavaScript(String url) async {
    Uri urlUri = Uri.parse(url);
    if (!await launchUrl(
      urlUri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutDomStorage(String url) async {
    Uri urlUri = Uri.parse(url);
    if (!await launchUrl(
      urlUri,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    Uri urlUri = Uri.parse(url);
    bool nativeAppLaunchSucceeded = await launchUrl(
      urlUri,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        urlUri,
        mode: LaunchMode.inAppWebView,
      );
    }
  }
}
