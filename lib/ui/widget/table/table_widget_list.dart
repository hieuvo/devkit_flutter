import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/table/standart_table.dart';
import 'package:devkitflutter/ui/widget/table/table_border.dart';
import 'package:devkitflutter/ui/widget/table/table_width.dart';
import 'package:flutter/material.dart';

class TableWidgetListPage extends StatefulWidget {
  const TableWidgetListPage({super.key});

  @override
  State<TableWidgetListPage> createState() => _TableWidgetListPageState();
}

class _TableWidgetListPageState extends State<TableWidgetListPage> {
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
            const Text('Table Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A widget that uses the table layout algorithm for its children.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.border_all,
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
                title: 'Standart Table',
                page: const StandartTablePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Table Border',
                page: const TableBorderPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Table Width',
                page: const TableWidthPage()),
          ],
        ));
  }
}
