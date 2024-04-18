/*
https://pub.dev/packages/percent_indicator
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator13Page extends StatefulWidget {
  const CircleIndicator13Page({super.key});

  @override
  State<CircleIndicator13Page> createState() => _CircleIndicator13PageState();
}

class _CircleIndicator13PageState extends State<CircleIndicator13Page> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Circle Indicator - Background Width',
                  desc: 'This is the example of circle indicator with background width'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 8.0,
                backgroundWidth: 1.0,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.4,
                center: const Text('40%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 4.0,
                backgroundWidth: 8.0,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.4,
                center: const Text('40%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
