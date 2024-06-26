import 'package:carousel_slider/carousel_slider.dart';
import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/banner_slider_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider5Page extends StatefulWidget {
  const BannerSlider5Page({super.key});

  @override
  State<BannerSlider5Page> createState() => _BannerSlider5PageState();
}

class _BannerSlider5PageState extends State<BannerSlider5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<BannerSliderModel> _bannerData = [];

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(id: 1, image: '$globalUrl/portrait_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: '$globalUrl/portrait_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: '$globalUrl/portrait_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: '$globalUrl/portrait_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 5, image: '$globalUrl/portrait_banner/5.jpg'));
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
      body: CarouselSlider(
        items: _bannerData.map((item) => Container(
          child: buildCacheNetworkImage(width: MediaQuery.of(context).size.width, url: item.image),
        )).toList(),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            enlargeCenterPage: false,
        ),
      ),
    );
  }
}
