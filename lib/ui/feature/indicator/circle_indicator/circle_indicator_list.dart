import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator1.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator10.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator11.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator12.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator13.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator14.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator15.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator16.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator2.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator3.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator4.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator5.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator6.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator7.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator8.dart';
import 'package:devkitflutter/ui/feature/indicator/circle_indicator/circle_indicator9.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CircleIndicatorListPage extends StatefulWidget {
  const CircleIndicatorListPage({super.key});

  @override
  State<CircleIndicatorListPage> createState() => _CircleIndicatorListPageState();
}

class _CircleIndicatorListPageState extends State<CircleIndicatorListPage> {
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
            const Text('Circle Indicator List', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Indicator with circle', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.adjust, size: 50, color: softBlue))
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 1 - Standart', page: const CircleIndicator1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 2 - With Text Inside', page: const CircleIndicator2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 3 - With Animation', page: const CircleIndicator3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 4 - Gradient Color', page: const CircleIndicator4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 5 - Inside Shape', page: const CircleIndicator5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 6 - Mask Filter', page: const CircleIndicator6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 7 - Start Angle', page: const CircleIndicator7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 8 - Widget Indicator', page: const CircleIndicator8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 9 - Widget Indicator with Icon', page: const CircleIndicator9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 10 - With Icon Inside', page: const CircleIndicator10Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 11 - Reverse', page: const CircleIndicator11Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 12 - Arc Style', page: const CircleIndicator12Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 13 - Background Width', page: const CircleIndicator13Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 14 - Restart Animation', page: const CircleIndicator14Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 15 - Animation Callback', page: const CircleIndicator15Page()),
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator 16 - Header & Footer', page: const CircleIndicator16Page()),
          ],
        )
    );
  }
}
