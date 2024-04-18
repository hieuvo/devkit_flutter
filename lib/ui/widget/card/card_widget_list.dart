import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/widget/card/border_radius_card.dart';
import 'package:devkitflutter/ui/widget/card/elevation_card.dart';
import 'package:devkitflutter/ui/widget/card/shadow_color_card.dart';
import 'package:devkitflutter/ui/widget/card/standart_card.dart';
import 'package:flutter/material.dart';

class CardWidgetListPage extends StatefulWidget {
  const CardWidgetListPage({super.key});

  @override
  State<CardWidgetListPage> createState() => _CardWidgetListPageState();
}

class _CardWidgetListPageState extends State<CardWidgetListPage> {
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
            const Text('Card Widget',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Card Widget is one of the usefull widget in Flutter',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.collections,
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
                title: 'Standart Card',
                page: const StandartCardPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Border Radius Card',
                page: const BorderRadiusCardPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Elevation Card',
                page: const ElevationCardPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shadow Color Card',
                page: const ShadowColorCardPage()),
          ],
        ));
  }
}
