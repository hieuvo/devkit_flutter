import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/progress_indicator/circular_progress_indicator.dart';
import 'package:devkitflutter/ui/widget/progress_indicator/linear_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidgetListPage extends StatefulWidget {
  const ProgressIndicatorWidgetListPage({super.key});

  @override
  State<ProgressIndicatorWidgetListPage> createState() =>
      _ProgressIndicatorWidgetListPageState();
}

class _ProgressIndicatorWidgetListPageState
    extends State<ProgressIndicatorWidgetListPage> {
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
            const Text('Progress Indicator Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Progress Indicator Widget shown to user when there is waiting data.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.refresh,
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
                title: 'Circular Progress Indicator',
                page: const CircularProgressIndicatorPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Linear Progress Indicator',
                page: const LinearProgressIndicatorPage()),
          ],
        ));
  }
}
