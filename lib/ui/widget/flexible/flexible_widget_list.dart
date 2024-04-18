import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/flexible/flexible_column.dart';
import 'package:devkitflutter/ui/widget/flexible/flexible_row.dart';
import 'package:flutter/material.dart';

class FlexibleWidgetListPage extends StatefulWidget {
  const FlexibleWidgetListPage({super.key});

  @override
  State<FlexibleWidgetListPage> createState() => _FlexibleWidgetListPageState();
}

class _FlexibleWidgetListPageState extends State<FlexibleWidgetListPage> {
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
            const Text('Flexible Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Flexible Widget used to divider with flex value',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.view_array,
                              size: 50, color: softBlue))),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.view_day,
                              size: 40, color: softBlue)))
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
                title: 'Flexible Row',
                page: const FlexibleRowPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Flexible Column',
                page: const FlexibleColumnPage()),
          ],
        ));
  }
}
