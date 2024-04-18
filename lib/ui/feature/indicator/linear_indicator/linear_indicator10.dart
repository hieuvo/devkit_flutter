/*
https://pub.dev/packages/percent_indicator
*/
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearIndicator10Page extends StatefulWidget {
  const LinearIndicator10Page({super.key});

  @override
  State<LinearIndicator10Page> createState() => _LinearIndicator10PageState();
}

class _LinearIndicator10PageState extends State<LinearIndicator10Page> {
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
                  title: 'Linear Indicator - Left & Right',
                  desc: 'This is the example of linear indicator with left & right'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: LinearPercentIndicator(
                lineHeight: 24.0,
                percent: 0.5,
                center: const Text("50.0%", style: TextStyle(
                    color: Colors.white
                )),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                leading: const Expanded(
                  child: Text("left"),
                ),
                trailing: const Expanded(
                    child: Text(
                      "right",
                      textAlign: TextAlign.end,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
