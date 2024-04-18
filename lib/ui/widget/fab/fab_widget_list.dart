import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/fab/fab_animation.dart';
import 'package:devkitflutter/ui/widget/fab/fab_position.dart';
import 'package:devkitflutter/ui/widget/fab/fab_with_border_radius.dart';
import 'package:devkitflutter/ui/widget/fab/fab_with_label.dart';
import 'package:devkitflutter/ui/widget/fab/fab_with_shape.dart';
import 'package:devkitflutter/ui/widget/fab/mini_fab.dart';
import 'package:devkitflutter/ui/widget/fab/standart_fab.dart';
import 'package:flutter/material.dart';

class FabWidgetListPage extends StatefulWidget {
  const FabWidgetListPage({super.key});

  @override
  State<FabWidgetListPage> createState() => _FabWidgetListPageState();
}

class _FabWidgetListPageState extends State<FabWidgetListPage> {
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
            const Text('Floating Action Button Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'A floating action button is a circular icon button that hovers over content to promote a primary action in the application.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.add_circle,
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
                title: 'Standart FAB',
                page: const StandartFabPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'FAB position',
                page: const FabPositionPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'FAB with label',
                page: const FabWithLabelPage()),
            _globalWidget.screenDetailList(
                context: context, title: 'Mini FAB', page: const MiniFabPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'FAB with shape',
                page: const FabWithShapePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'FAB with border radius',
                page: const FabWithBorderRadiusPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'FAB animation',
                page: const FabAnimationPage()),
          ],
        ));
  }
}
