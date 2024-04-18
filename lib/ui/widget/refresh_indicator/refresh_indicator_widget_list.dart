import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/refresh_indicator/custom_refresh_indicator.dart';
import 'package:devkitflutter/ui/widget/refresh_indicator/standart_refresh_indicator.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorWidgetListPage extends StatefulWidget {
  const RefreshIndicatorWidgetListPage({super.key});

  @override
  State<RefreshIndicatorWidgetListPage> createState() =>
      _RefreshIndicatorWidgetListPageState();
}

class _RefreshIndicatorWidgetListPageState
    extends State<RefreshIndicatorWidgetListPage> {
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
            const Text('Refresh Indicator Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Refresh Indicator Widget is used to refresh data',
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
                title: 'Standart Refresh Indicator',
                page: const StandartRefreshIndicatorPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Custom Refresh Indicator',
                page: const CustomRefreshIndicatorPage()),
          ],
        ));
  }
}
