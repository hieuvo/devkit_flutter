import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/transform/rotate_transform.dart';
import 'package:devkitflutter/ui/widget/transform/scale_transform.dart';
import 'package:devkitflutter/ui/widget/transform/skew_transform.dart';
import 'package:devkitflutter/ui/widget/transform/translate_transform.dart';
import 'package:flutter/material.dart';

class TransformWidgetListPage extends StatefulWidget {
  const TransformWidgetListPage({super.key});

  @override
  State<TransformWidgetListPage> createState() => _TransformWidgetListPageState();
}

class _TransformWidgetListPageState extends State<TransformWidgetListPage> {
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
            const Text('Transform Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Transform Widget used to transform widget in Flutter.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.transform,
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
                title: 'Rotate Transform',
                page: const RotateTransformPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Scale Transform',
                page: const ScaleTransformPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Translate Transform',
                page: const TranslateTransformPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Skew Transform',
                page: const SkewTransformPage()),
          ],
        ));
  }
}
