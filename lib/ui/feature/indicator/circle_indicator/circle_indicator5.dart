/*
https://pub.dev/packages/percent_indicator
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator5Page extends StatefulWidget {
  const CircleIndicator5Page({super.key});

  @override
  State<CircleIndicator5Page> createState() => _CircleIndicator5PageState();
}

class _CircleIndicator5PageState extends State<CircleIndicator5Page> {
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
                  title: 'Circle Indicator - Inside Shape',
                  desc: 'This is the example of circle indicator with inside shape'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 12.0,
                percent: 0.6,
                circularStrokeCap: CircularStrokeCap.square,
                center: const Text('60%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.deepPurple,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 12.0,
                percent: 0.6,
                circularStrokeCap: CircularStrokeCap.round,
                center: const Text('60%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
