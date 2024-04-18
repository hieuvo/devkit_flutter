import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/combine_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/cupertino_page_route.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/fade_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/material_page_route.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/rotation_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/scale_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/size_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/slide_route_animation.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/without_animation.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PageRouteAnimationListPage extends StatefulWidget {
  const PageRouteAnimationListPage({super.key});

  @override
  State<PageRouteAnimationListPage> createState() =>
      _PageRouteAnimationListPageState();
}

class _PageRouteAnimationListPageState
    extends State<PageRouteAnimationListPage> {
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
            const Text('Page Route Animation',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Page route animation is used to animate transition when change between screen.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.keyboard_tab,
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
                title: 'Material Page Route',
                page: const MaterialPageRoutePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Cupertino Page Route',
                page: const CupertinoPageRoutePage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Page Route Without Animation',
                page: const WithoutAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Slide Route Animation',
                page: const SlideRouteAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Scale Route Animation',
                page: const ScaleRouteAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Rotation Route Animation',
                page: const RotationRouteAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Size Route Animation',
                page: const SizeRouteAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Fade Route Animation',
                page: const FadeRouteAnimationPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Combine Route Animation (Scale & Rotate)',
                page: const CombineRouteAnimationPage()),
          ],
        ));
  }
}
