import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/divider/horizontal_divider.dart';
import 'package:devkitflutter/ui/widget/divider/vertical_divider.dart';
import 'package:flutter/material.dart';

class DividerWidgetListPage extends StatefulWidget {
  const DividerWidgetListPage({super.key});

  @override
  State<DividerWidgetListPage> createState() => _DividerWidgetListPageState();
}

class _DividerWidgetListPageState extends State<DividerWidgetListPage> {
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
            const Text('Divider Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Divider Widget used to create divider line horizontaly or verticaly.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.horizontal_rule,
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
                title: 'Horizontal Divider',
                page: const HorizontalDividerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Vertical Divider',
                page: const VerticalDividerPage()),
          ],
        ));
  }
}
