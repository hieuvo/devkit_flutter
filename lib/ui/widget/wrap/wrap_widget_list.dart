import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/wrap/alignment_wrap.dart';
import 'package:devkitflutter/ui/widget/wrap/spacing_wrap.dart';
import 'package:devkitflutter/ui/widget/wrap/standart_wrap.dart';
import 'package:devkitflutter/ui/widget/wrap/text_direction_wrap.dart';
import 'package:devkitflutter/ui/widget/wrap/vertical_direction_wrap.dart';
import 'package:devkitflutter/ui/widget/wrap/wrap_direction.dart';
import 'package:flutter/material.dart';

class WrapWidgetListPage extends StatefulWidget {
  const WrapWidgetListPage({super.key});

  @override
  State<WrapWidgetListPage> createState() => _WrapWidgetListPageState();
}

class _WrapWidgetListPageState extends State<WrapWidgetListPage> {
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
            const Text('Wrap Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Wrap Widget usually used to list data from left to right.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.wrap_text,
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
                title: 'Standart Wrap',
                page: const StandartWrapPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Wrap Direction',
                page: const WrapDirectionPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Spacing Wrap',
                page: const SpacingWrapPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Alignment Wrap',
                page: const AlignmentWrapPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Vertical Direction Wrap',
                page: const VerticalDirectionWrapPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Text Direction Wrap',
                page: const TextDirectionWrapPage()),
          ],
        ));
  }
}
