/*
https://pub.dev/packages/percent_indicator
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator16Page extends StatefulWidget {
  const CircleIndicator16Page({super.key});

  @override
  State<CircleIndicator16Page> createState() => _CircleIndicator16PageState();
}

class _CircleIndicator16PageState extends State<CircleIndicator16Page> {
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
                  title: 'Circle Indicator - Header & Footer',
                  desc: 'This is the example of circle indicator with header & footer'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                header: const Text('This is Header of the Circle Indicator'),
                footer: const Text('This is Footer of the Circle Indicator'),
                radius: 90.0,
                lineWidth: 10.0,
                percent: 0.8,
                center: const Text('80%'),
                backgroundColor: Colors.grey,
                linearGradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.clamp,
                  stops: [0.0, 1.0],
                  colors: <Color>[
                    Colors.purple,
                    Colors.green,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
