import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/dialog/alert_dialog.dart';
import 'package:devkitflutter/ui/widget/dialog/custom_dialog.dart';
import 'package:devkitflutter/ui/widget/dialog/simple_dialog.dart';
import 'package:devkitflutter/ui/widget/dialog/standart_dialog.dart';
import 'package:flutter/material.dart';

class DialogListPage extends StatefulWidget {
  const DialogListPage({super.key});

  @override
  State<DialogListPage> createState() => _DialogListPageState();
}

class _DialogListPageState extends State<DialogListPage> {
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
            const Text('Dialog',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Dialog is used to show popup.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.event,
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
                title: 'Standart Dialog',
                page: const StandartDialogPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Simple Dialog',
                page: const SimpleDialogPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Alert Dialog',
                page: const AlertDialogPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Custom Dialog',
                page: const CustomDialogPage()),
          ],
        ));
  }
}
