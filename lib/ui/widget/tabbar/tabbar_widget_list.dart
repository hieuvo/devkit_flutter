import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/tabbar/bottom_tabbar.dart';
import 'package:devkitflutter/ui/widget/tabbar/standart_tabbar.dart';
import 'package:devkitflutter/ui/widget/tabbar/tabbar_with_controller.dart';
import 'package:devkitflutter/ui/widget/tabbar/tabbar_with_icon.dart';
import 'package:devkitflutter/ui/widget/tabbar/tabbar_with_scroll.dart';
import 'package:flutter/material.dart';

class TabbarWidgetListPage extends StatefulWidget {
  const TabbarWidgetListPage({super.key});

  @override
  State<TabbarWidgetListPage> createState() => _TabbarWidgetListPageState();
}

class _TabbarWidgetListPageState extends State<TabbarWidgetListPage> {
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
            const Text('TabBar Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'TabBar Widget is used to create tab view',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.table_chart,
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
                title: 'Standart TabBar',
                page: const StandartTabbarPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'TabBar with Icon',
                page: const TabbarWithIconPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Bottom TabBar',
                page: const BottomTabbarPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'TabBar with Controller',
                page: const TabbarWithControllerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'TabBar with Scroll',
                page: const TabbarWithScrollPage()),
          ],
        ));
  }
}
