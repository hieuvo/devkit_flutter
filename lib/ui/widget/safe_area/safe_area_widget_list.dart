import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/safe_area/setting_side_safe_area.dart';
import 'package:devkitflutter/ui/widget/safe_area/with_safe_area.dart';
import 'package:devkitflutter/ui/widget/safe_area/without_safe_area.dart';
import 'package:flutter/material.dart';

class SafeAreaWidgetListPage extends StatefulWidget {
  const SafeAreaWidgetListPage({super.key});

  @override
  State<SafeAreaWidgetListPage> createState() => _SafeAreaWidgetListPageState();
}

class _SafeAreaWidgetListPageState extends State<SafeAreaWidgetListPage> {
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
            const Text('Safe Area Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A widget that insets its child by sufficient padding to avoid intrusions by the operating system. Only can be test on Android and iOS.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.settings_overscan,
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
                title: 'Without Safe Area',
                page: const WithoutSafeAreaPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'With Safe Area',
                page: const WithSafeAreaPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Setting Side Only Top',
                page: const SettingSidePage()),
          ],
        ));
  }
}
