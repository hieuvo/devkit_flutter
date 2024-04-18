import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_picker/cupertino_date_picker1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_picker/cupertino_date_picker2.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerListPage extends StatefulWidget {
  const CupertinoDatePickerListPage({super.key});

  @override
  State<CupertinoDatePickerListPage> createState() =>
      _CupertinoDatePickerListPageState();
}

class _CupertinoDatePickerListPageState
    extends State<CupertinoDatePickerListPage> {
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
            const Text('Cupertino Date Picker',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('An iOS-style date picker.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.date_range,
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
                title: 'Cupertino Date Picker 1 - Standart',
                page: const CupertinoDatePicker1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Date Picker 2 - with Dialog',
                page: const CupertinoDatePicker2Page()),
          ],
        ));
  }
}
