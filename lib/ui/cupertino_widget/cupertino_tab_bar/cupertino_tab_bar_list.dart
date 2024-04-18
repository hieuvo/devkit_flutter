import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar3.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar4.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoTabBarListPage extends StatefulWidget {
  const CupertinoTabBarListPage({super.key});

  @override
  State<CupertinoTabBarListPage> createState() => _CupertinoTabBarListPageState();
}

class _CupertinoTabBarListPageState extends State<CupertinoTabBarListPage> {
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
            const Text('Cupertino Tab Bar, Tab Scaffold & Tab View', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold. For Cupertino Tab View, you can check it at example 4.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.call_to_action, size: 50, color: softBlue))
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 1 - Standart', page: const CupertinoTabBar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 2 - Properties', page: const CupertinoTabBar2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 3 - New Route', page: const CupertinoTabBar3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 4 - Flat Navigation', page: const CupertinoTabBar4Page()),
          ],
        )
    );
  }
}
