import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/app_theme/app_theme1.dart';
import 'package:devkitflutter/ui/feature/app_theme/app_theme2.dart';
import 'package:devkitflutter/ui/feature/app_theme/app_theme3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppThemeListPage extends StatefulWidget {
  const AppThemeListPage({super.key});

  @override
  State<AppThemeListPage> createState() => _AppThemeListPageState();
}

class _AppThemeListPageState extends State<AppThemeListPage> {
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
            const Text('App Theme',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'App theme is used for choose theme of your application (Light Theme, Dark Theme, Custom Theme).',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.invert_colors_on,
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
                title: 'App Theme 1 (Default Light Theme / Dark Theme)',
                page: const AppTheme1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'App Theme 2 (Custom Theme)',
                page: const AppTheme2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'App Theme 3 (Change Theme From Another Screen)',
                page: const AppTheme3Page()),
          ],
        ));
  }
}
