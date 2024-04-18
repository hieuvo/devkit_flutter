import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker3.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker4.dart';
import 'package:flutter/material.dart';

class CupertinoDateTimePickerListPage extends StatefulWidget {
  const CupertinoDateTimePickerListPage({super.key});

  @override
  State<CupertinoDateTimePickerListPage> createState() =>
      _CupertinoDateTimePickerListPageState();
}

class _CupertinoDateTimePickerListPageState
    extends State<CupertinoDateTimePickerListPage> {
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
            const Text('Cupertino Date & Time Picker',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('An iOS-style date & time picker.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.date_range,
                              size: 50, color: softBlue))),
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
                title: 'Cupertino Date & Time Picker 1 - Standart',
                page: const CupertinoDateTimePicker1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Date & Time Picker 2 - Time Format',
                page: const CupertinoDateTimePicker2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title:
                    'Cupertino Date & Time Picker 3 - Minimum & Maximum Date',
                page: const CupertinoDateTimePicker3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Date & Time Picker 4 - with Dialog',
                page: const CupertinoDateTimePicker4Page()),
          ],
        ));
  }
}
