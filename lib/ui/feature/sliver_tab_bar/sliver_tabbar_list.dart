import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/sliver_tab_bar/sliver_tabbar1.dart';
import 'package:devkitflutter/ui/feature/sliver_tab_bar/sliver_tabbar2.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SliverTabbarListPage extends StatefulWidget {
  const SliverTabbarListPage({super.key});

  @override
  State<SliverTabbarListPage> createState() => _SliverTabbarListPageState();
}

class _SliverTabbarListPageState extends State<SliverTabbarListPage> {
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
            const Text('Sliver Tab Bar',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Sliver Tab Bar used to create tab view with app bar animation when scrolling up or scrolling down.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.table_chart,
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
                title: 'Sliver Tab Bar 1',
                page: const SliverTabbar1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sliver Tab Bar 2 (Using SliverOverlapAbsorber)',
                page: const SliverTabbar2Page()),
          ],
        ));
  }
}
