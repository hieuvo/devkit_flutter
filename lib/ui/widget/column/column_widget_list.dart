import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/column/horizontal_alignment_column.dart';
import 'package:devkitflutter/ui/widget/column/standart_column.dart';
import 'package:devkitflutter/ui/widget/column/vertical_alignment_column.dart';
import 'package:devkitflutter/ui/widget/column/vertical_with_space_column.dart';
import 'package:flutter/material.dart';

class ColumnWidgetListPage extends StatefulWidget {
  const ColumnWidgetListPage({super.key});

  @override
  State<ColumnWidgetListPage> createState() => _ColumnWidgetListPageState();
}

class _ColumnWidgetListPageState extends State<ColumnWidgetListPage> {
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
            const Text('Column Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Column Widget is used to stacking your data from top to bottom',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.table_rows,
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
                title: 'Standart Column',
                page: const StandartColumnPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Horizontal Alignment',
                page: const HorizontalAlignmentColumnPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Vertical Alignment',
                page: const VerticalAlignmentColumnPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Vertical with Space',
                page: const VerticalWithSpaceColumnPage()),
          ],
        ));
  }
}
