import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_appbar_list.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_combine.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_grid_list.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_list_list.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_to_box_adapter.dart';
import 'package:devkitflutter/ui/widget/sliver/sticky_sliver.dart';
import 'package:flutter/material.dart';

class SliverWidgetListPage extends StatefulWidget {
  const SliverWidgetListPage({super.key});

  @override
  State<SliverWidgetListPage> createState() => _SliverWidgetListPageState();
}

class _SliverWidgetListPageState extends State<SliverWidgetListPage> {
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
            const Text('Sliver Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A sliver is a portion of a scrollable area that you can define to behave in a special way. You can use slivers to achieve custom scrolling effects, such as elastic scrolling.',
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
                title: 'Sliver Appbar',
                page: const SliverAppbarListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sliver List',
                page: const SliverListListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sliver Grid',
                page: const SliverGridListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sliver To Box Adapter',
                page: const SliverToBoxAdapterPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sliver Combined',
                page: const SliverCombinePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sticky Sliver',
                page: const StickySliverPage()),
          ],
        ));
  }
}
