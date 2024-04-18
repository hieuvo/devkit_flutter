import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_slider/cupertino_slider1.dart';
import 'package:devkitflutter/ui/cupertino_widget/cupertino_slider/cupertino_slider2.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSliderListPage extends StatefulWidget {
  const CupertinoSliderListPage({super.key});

  @override
  State<CupertinoSliderListPage> createState() =>
      _CupertinoSliderListPageState();
}

class _CupertinoSliderListPageState extends State<CupertinoSliderListPage> {
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
            const Text('Cupertino Slider',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Used to select from a range of values.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(CupertinoIcons.slider_horizontal_3,
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
                title: 'Cupertino Slider 1 - Standart',
                page: const CupertinoSlider1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Slider 2 - Properties',
                page: const CupertinoSlider2Page()),
          ],
        ));
  }
}
