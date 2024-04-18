import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_appbar1.dart';
import 'package:devkitflutter/ui/widget/sliver/sliver_appbar2.dart';
import 'package:flutter/material.dart';

class SliverAppbarListPage extends StatefulWidget {
  const SliverAppbarListPage({super.key});

  @override
  State<SliverAppbarListPage> createState() => _SliverAppbarListPageState();
}

class _SliverAppbarListPageState extends State<SliverAppbarListPage> {
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
            const Text('Sliver App Bar',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A material design app bar that integrates with a CustomScrollView.',
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
                page: const SliverAppbar1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Example 2',
                page: const SliverAppbar2Page()),
          ],
        ));
  }
}
