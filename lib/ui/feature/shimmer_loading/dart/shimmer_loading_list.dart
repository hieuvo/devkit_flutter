import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading1.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading10.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading11.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading12.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading2.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading3.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading4.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading6.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading7.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading5.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading8.dart';
import 'package:devkitflutter/ui/feature/shimmer_loading/dart/shimmer_loading9.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingListPage extends StatefulWidget {
  const ShimmerLoadingListPage({super.key});

  @override
  State<ShimmerLoadingListPage> createState() => _ShimmerLoadingListPageState();
}

class _ShimmerLoadingListPageState extends State<ShimmerLoadingListPage> {
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
            const Text('Shimmer Loading',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Shimmer loading used to shown loading when fetching data.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.blur_linear_sharp,
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
                title: 'Shimmer Loading 1 (Default Content)',
                page: const ShimmerLoading1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 2 (Horizontal Content)',
                page: const ShimmerLoading2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 3 (Horizontal Product)',
                page: const ShimmerLoading3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title:
                    'Shimmer Loading 4 (Horizontal Product with Discount Label)',
                page: const ShimmerLoading4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 5 (Grid Product with Discount Label)',
                page: const ShimmerLoading5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 6 (Banner Slider)',
                page: const ShimmerLoading6Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 7 (Banner without Slider)',
                page: const ShimmerLoading7Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 8 (Grid Product)',
                page: const ShimmerLoading8Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 9 (Grid Product Trending)',
                page: const ShimmerLoading9Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 10 (Category Menu)',
                page: const ShimmerLoading10Page()),
            _globalWidget.screenDetailList(
                context: context,
                title:
                    'Shimmer Loading 11 (Category Menu with Horizontal Scroll)',
                page: const ShimmerLoading11Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Shimmer Loading 12 (Content List)',
                page: const ShimmerLoading12Page()),
          ],
        ));
  }
}
