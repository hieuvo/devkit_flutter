import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading7Page extends StatefulWidget {
  const ShimmerLoading7Page({super.key});

  @override
  State<ShimmerLoading7Page> createState() => _ShimmerLoading7PageState();
}

class _ShimmerLoading7PageState extends State<ShimmerLoading7Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _shimmerColor = Colors.grey[200]!;

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
    double bannerWidth = MediaQuery.of(context).size.width;
    double bannerHeight = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading 7',
                desc:
                    'This is the example of shimmer loading for banner without slider'),
          ),
          Container(child: buildShimmerBanner(bannerWidth, bannerHeight))
        ],
      ),
    );
  }

  Widget buildShimmerBanner(bannerWidth, bannerHeight) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: _shimmerColor,
      period: const Duration(milliseconds: 1000),
      child: Container(
        width: bannerWidth,
        height: bannerHeight,
        color: _shimmerColor,
      ),
    );
  }
}
