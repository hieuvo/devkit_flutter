import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield3.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield4.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield5.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield6.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield7.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield8.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_textfield/cupertino_textfield9.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldListPage extends StatefulWidget {
  const CupertinoTextFieldListPage({super.key});

  @override
  State<CupertinoTextFieldListPage> createState() =>
      _CupertinoTextFieldListPageState();
}

class _CupertinoTextFieldListPageState
    extends State<CupertinoTextFieldListPage> {
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
            const Text('Cupertino Text Field',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('An iOS-style text field..',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.text_fields,
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
                title: 'Cupertino Text Field 1 - Standart',
                page: const CupertinoTextField1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 2 - Font Style',
                page: const CupertinoTextField2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 3 - Placeholder',
                page: const CupertinoTextField3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 4 - Decoration',
                page: const CupertinoTextField4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 5 - Password',
                page: const CupertinoTextField5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 6 - Keyboard Action',
                page: const CupertinoTextField6Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 7 - Keyboard Type',
                page: const CupertinoTextField7Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 8 - Multi Line',
                page: const CupertinoTextField8Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Text Field 9 - Icon & Controller',
                page: const CupertinoTextField9Page()),
          ],
        ));
  }
}
