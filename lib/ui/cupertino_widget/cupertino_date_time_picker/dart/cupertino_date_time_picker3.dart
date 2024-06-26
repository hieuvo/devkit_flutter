import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDateTimePicker3Page extends StatefulWidget {
  const CupertinoDateTimePicker3Page({super.key});

  @override
  State<CupertinoDateTimePicker3Page> createState() => _CupertinoDateTimePicker3PageState();
}

class _CupertinoDateTimePicker3PageState extends State<CupertinoDateTimePicker3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  DateTime _dateTime = DateTime.now();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Cupertino Date & Time Picker 3 - Minimum & Maximum Date',
                  desc: 'This is the example of Cupertino Date & Time Picker with minimum & maximum date'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: _dateTime,
                  mode: CupertinoDatePickerMode.dateAndTime,
                  minimumDate: DateTime(DateTime.now().year, DateTime.now().month-1, DateTime.now().day),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (dateTime){
                    setState(() {
                      _dateTime = dateTime;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
