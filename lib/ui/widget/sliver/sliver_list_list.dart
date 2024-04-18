import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_list1.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_list2.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_list3.dart';
import 'package:flutter/material.dart';

class SliverListListPage extends StatefulWidget {
  const SliverListListPage({super.key});

  @override
  State<SliverListListPage> createState() => _SliverListListPageState();
}

class _SliverListListPageState extends State<SliverListListPage> {
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
            const Text('Sliver List',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A sliver that places multiple box children in a linear array along the main axis.',
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
                title: 'Method 1',
                page: const SliverList1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Method 2',
                page: const SliverList2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Method 3',
                page: const SliverList3Page()),
          ],
        ));
  }
}
