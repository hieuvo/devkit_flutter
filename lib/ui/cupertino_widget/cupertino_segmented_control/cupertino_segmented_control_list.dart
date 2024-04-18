import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_segmented_control/cupertino_segmented_control1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_segmented_control/cupertino_segmented_control2.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_segmented_control/cupertino_segmented_control3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControlListPage extends StatefulWidget {
  const CupertinoSegmentedControlListPage({super.key});

  @override
  State<CupertinoSegmentedControlListPage> createState() =>
      _CupertinoSegmentedControlListPageState();
}

class _CupertinoSegmentedControlListPageState
    extends State<CupertinoSegmentedControlListPage> {
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
            const Text('Cupertino Segmented Control',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.view_column,
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
                title: 'Cupertino Segmented Control 1 - Standart',
                page: const CupertinoSegmentedControl1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Segmented Control 2 - Properties',
                page: const CupertinoSegmentedControl2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Segmented Control 3 - with Map',
                page: const CupertinoSegmentedControl3Page()),
          ],
        ));
  }
}
