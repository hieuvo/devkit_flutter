import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/drawer/drawer_custom_header.dart';
import 'package:devkitflutter/ui/widget/drawer/drawer_custom_shape.dart';
import 'package:devkitflutter/ui/widget/drawer/drawer_right.dart';
import 'package:devkitflutter/ui/widget/drawer/standart_drawer.dart';
import 'package:flutter/material.dart';

class DrawerListPage extends StatefulWidget {
  const DrawerListPage({super.key});

  @override
  State<DrawerListPage> createState() => _DrawerListPageState();
}

class _DrawerListPageState extends State<DrawerListPage> {
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
            const Text('Drawer',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Drawer usually used for menu',
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
                title: 'Standart Drawer',
                page: const StandartDrawerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Drawer at the right',
                page: const DrawerRightPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Drawer Custom Header',
                page: const DrawerCustomHeaderPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Drawer Custom Shape',
                page: const DrawerCustomShapePage()),
          ],
        ));
  }
}
