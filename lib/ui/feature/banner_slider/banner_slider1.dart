import 'package:carousel_slider/carousel_slider.dart';
import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/banner_slider_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider1Page extends StatefulWidget {
  const BannerSlider1Page({super.key});

  @override
  State<BannerSlider1Page> createState() => _BannerSlider1PageState();
}

class _BannerSlider1PageState extends State<BannerSlider1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _bulletColor = const Color(0xff01aed6);

  int _currentImageSlider = 0;
  
  final List<BannerSliderModel> _bannerData = [];

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(id: 1, image: '$globalUrl/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: '$globalUrl/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: '$globalUrl/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: '$globalUrl/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 5, image: '$globalUrl/home_banner/5.jpg'));
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
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: _globalWidget.createDetailWidget(
                  title: 'Banner Slider 1',
                  desc: 'This is the example of banner slider with full width'
              ),
            ),
            Column(
              children: [
                CarouselSlider(
                  items: _bannerData.map((item) => Container(
                    child: buildCacheNetworkImage(width: 0, height: 0, url: item.image),
                  )).toList(),
                  options: CarouselOptions(
                      aspectRatio: 8/6,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration: const Duration(milliseconds: 300),
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageSlider = index;
                        });
                      }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerData.map((item) {
                    int index = _bannerData.indexOf(item);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageSlider == index
                            ? _bulletColor
                            : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
    );
  }
}
