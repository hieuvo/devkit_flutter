import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/row/horizontal_alignment_row.dart';
import 'package:devkitflutter/ui/widget/row/horizontal_with_space_row.dart';
import 'package:devkitflutter/ui/widget/row/standart_row.dart';
import 'package:devkitflutter/ui/widget/row/vertical_alignment_row.dart';
import 'package:flutter/material.dart';

class RowWidgetListPage extends StatefulWidget {
  const RowWidgetListPage({super.key});

  @override
  State<RowWidgetListPage> createState() => _RowWidgetListPageState();
}

class _RowWidgetListPageState extends State<RowWidgetListPage> {
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
            const Text('Row Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Column Widget is used to stacking your data from left to right',
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
                title: 'Standart Row',
                page: const StandartRowPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Horizontal Alignment',
                page: const HorizontalAlignmentRowPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Horizontal with Space',
                page: const HorizontalWithSpaceRowPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Vertical Alignment',
                page: const VerticalAlignmentRowPage()),
          ],
        ));
  }
}
