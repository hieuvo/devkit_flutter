import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/webview/webview1.dart';
import 'package:devkitflutter/ui/feature/webview/webview2.dart';
import 'package:devkitflutter/ui/feature/webview/webview3.dart';
import 'package:devkitflutter/ui/feature/webview/webview4.dart';
import 'package:devkitflutter/ui/feature/webview/webview5.dart';
import 'package:devkitflutter/ui/feature/webview/webview6.dart';
import 'package:devkitflutter/ui/feature/webview/webview7.dart';
import 'package:devkitflutter/ui/feature/webview/webview8.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class WebviewListPage extends StatefulWidget {
  const WebviewListPage({super.key});

  @override
  State<WebviewListPage> createState() => _WebviewListPageState();
}

class _WebviewListPageState extends State<WebviewListPage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Webview',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Webview on mobile platform',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.web_asset,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 1 (Webview without Javascript)',
                page: const Webview1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 2 (Webview with Javascript Enabled)',
                page: const Webview2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 3 (Webview from Local HTML File)',
                page: const Webview3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 4 (Webview from HTML String)',
                page: const Webview4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 5 (Communicate from Flutter to Webview)',
                page: const Webview5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 6 (Communicate from Webview to Flutter)',
                page: const Webview6Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Webview 7 (Handle Back Button)',
                page: const Webview7Page()),
            _globalWidget.screenDetailList(
                context: context,
                title:
                    'Webview 8 (Handle no internet connection / custom error pages)',
                page: const Webview8Page()),
          ],
        ));
  }
}
