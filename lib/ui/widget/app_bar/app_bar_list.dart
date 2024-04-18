import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/app_bar/app_bar1.dart';
import 'package:devkitflutter/ui/widget/app_bar/app_bar2.dart';
import 'package:devkitflutter/ui/widget/app_bar/app_bar3.dart';
import 'package:devkitflutter/ui/widget/app_bar/app_bar4.dart';
import 'package:flutter/material.dart';

class AppBarListPage extends StatefulWidget {
  const AppBarListPage({super.key});

  @override
  State<AppBarListPage> createState() => _AppBarListPageState();
}

class _AppBarListPageState extends State<AppBarListPage> {
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
            const Text('App Bar',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.menu,
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
                title: 'App Bar 1 - Standart',
                page: const AppBar1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'App Bar 2 - Image Title',
                page: const AppBar2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'App Bar 3 - Icon',
                page: const AppBar3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'App Bar 4 - Properties',
                page: const AppBar4Page()),
          ],
        ));
  }
}
