import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_grid1.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_grid2.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_grid3.dart';
import 'package:flutter/material.dart';

class SliverGridListPage extends StatefulWidget {
  const SliverGridListPage({super.key});

  @override
  State<SliverGridListPage> createState() => _SliverGridListPageState();
}

class _SliverGridListPageState extends State<SliverGridListPage> {
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
            const Text('Sliver Grid',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A sliver that places multiple box children in a two dimensional arrangement.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.view_list,
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
                title: 'Example 1',
                page: const SliverGrid1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Example 2',
                page: const SliverGrid2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Example 3',
                page: const SliverGrid3Page()),
          ],
        ));
  }
}
