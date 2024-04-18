import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/url_launcher/url_launcher1.dart';
import 'package:devkitflutter/ui/feature/url_launcher/url_launcher2.dart';
import 'package:devkitflutter/ui/feature/url_launcher/url_launcher3.dart';
import 'package:devkitflutter/ui/feature/url_launcher/url_launcher4.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class UrlLauncherListPage extends StatefulWidget {
  const UrlLauncherListPage({super.key});

  @override
  State<UrlLauncherListPage> createState() => _UrlLauncherListPageState();
}

class _UrlLauncherListPageState extends State<UrlLauncherListPage> {
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
            const Text('URL Launcher',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A Flutter plugin for launching a URL in the mobile platform. Supports iOS, Android, web, Windows, macOS, and Linux.\n\nSome function will not work properly if you run it on simulator.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.launch,
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
                title: 'URL Launcher 1 - Website',
                page: const UrlLauncher1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'URL Launcher 2 - Send Email',
                page: const UrlLauncher2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'URL Launcher 3 - Call Phone Number',
                page: const UrlLauncher3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'URL Launcher 4 - Send SMS',
                page: const UrlLauncher4Page()),
          ],
        ));
  }
}
