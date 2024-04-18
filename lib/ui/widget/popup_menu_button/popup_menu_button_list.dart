import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button1.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button2.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button3.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button4.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button5.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button6.dart';
import 'package:devkitflutter/ui/widget/popup_menu_button/popup_menu_button7.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonListPage extends StatefulWidget {
  const PopupMenuButtonListPage({super.key});

  @override
  State<PopupMenuButtonListPage> createState() =>
      _PopupMenuButtonListPageState();
}

class _PopupMenuButtonListPageState extends State<PopupMenuButtonListPage> {
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
            const Text('Popup Menu Button',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected. The value passed to onSelected is the value of the selected menu item.',
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
                title: 'Popup Menu Button 1 - Standart',
                page: const PopupMenuButton1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 2 - Item Builder',
                page: const PopupMenuButton2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 3 - On Selected',
                page: const PopupMenuButton3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 4 - Elevation',
                page: const PopupMenuButton4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 5 - Child',
                page: const PopupMenuButton5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 6 - Offset',
                page: const PopupMenuButton6Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Popup Menu Button 7 - AppBar',
                page: const PopupMenuButton7Page()),
          ],
        ));
  }
}
