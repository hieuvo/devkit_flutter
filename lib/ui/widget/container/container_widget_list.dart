import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/container/border_container.dart';
import 'package:devkitflutter/ui/widget/container/border_radius_container.dart';
import 'package:devkitflutter/ui/widget/container/coloring_container.dart';
import 'package:devkitflutter/ui/widget/container/gradient_color_container.dart';
import 'package:devkitflutter/ui/widget/container/margin_container.dart';
import 'package:devkitflutter/ui/widget/container/padding_container.dart';
import 'package:devkitflutter/ui/widget/container/shadow_container.dart';
import 'package:devkitflutter/ui/widget/container/standart_container.dart';
import 'package:flutter/material.dart';

class ContainerWidgetListPage extends StatefulWidget {
  const ContainerWidgetListPage({super.key});

  @override
  State<ContainerWidgetListPage> createState() =>
      _ContainerWidgetListPageState();
}

class _ContainerWidgetListPageState extends State<ContainerWidgetListPage> {
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
            const Text('Container Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Container Widget is one of the main widget in Flutter.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.highlight_alt,
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
                title: 'Standart Container',
                page: const StandartContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Coloring Container',
                page: const ColoringContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Gradient Color Container',
                page: const GradientColorContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Margin on Container',
                page: const MarginContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Padding on Container',
                page: const PaddingContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Border Container',
                page: const BorderContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Border Radius Container',
                page: const BorderRadiusContainerPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shadow Container',
                page: const ShadowContainerPage()),
          ],
        ));
  }
}
