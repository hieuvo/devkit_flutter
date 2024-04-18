import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_1.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_2.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_3.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_4.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_5.dart';
import 'package:devkitflutter/ui/widget/animated_list/animated_list_6.dart';
import 'package:flutter/material.dart';

class AnimatedListWidgetListPage extends StatefulWidget {
  const AnimatedListWidgetListPage({super.key});

  @override
  State<AnimatedListWidgetListPage> createState() =>
      _AnimatedListWidgetListPageState();
}

class _AnimatedListWidgetListPageState
    extends State<AnimatedListWidgetListPage> {
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
            const Text('Animated List',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A scrolling container that animates items when they are inserted or removed.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.list,
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
                title: 'Animated List 1',
                page: const AnimatedList1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Animated List 2',
                page: const AnimatedList2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Animated List 3\n(Slide Animation)',
                page: const AnimatedList3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Animated List 4\n(Rotate Animation)',
                page: const AnimatedList4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Animated List 5\n(Combine Animation)',
                page: const AnimatedList5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Animated List 6\n(On Init)',
                page: const AnimatedList6Page()),
          ],
        ));
  }
}
