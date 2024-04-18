import 'package:carousel_slider/carousel_slider.dart';
import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/banner_slider_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({super.key});

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _color1 = const Color(0xFF005288);
  final Color _color2 = const Color(0xFF37474f);
  final Color _color3 = const Color(0xFFf7941e);

  int _currentIndex = 0;

  int _currentImageSlider = 0;

  final List<BannerSliderModel> _bannerData = [];
  final List<BannerSliderModel> _movieData = [];
  late String _movieTitle;

  @override
  void initState() {
    _bannerData
        .add(BannerSliderModel(id: 1, image: '$globalUrl/home_banner/1.jpg'));
    _bannerData
        .add(BannerSliderModel(id: 2, image: '$globalUrl/home_banner/2.jpg'));
    _bannerData
        .add(BannerSliderModel(id: 3, image: '$globalUrl/home_banner/3.jpg'));
    _bannerData
        .add(BannerSliderModel(id: 4, image: '$globalUrl/home_banner/4.jpg'));
    _bannerData
        .add(BannerSliderModel(id: 5, image: '$globalUrl/home_banner/5.jpg'));

    _movieData.add(BannerSliderModel(
        id: 1, name: 'Bloodshot', image: '$globalUrl/movie/bloodshot.jpg'));
    _movieData.add(BannerSliderModel(
        id: 2, name: 'Dolittle', image: '$globalUrl/movie/dolittle.jpg'));
    _movieData.add(BannerSliderModel(
        id: 3,
        name: 'The Invisible Man',
        image: '$globalUrl/movie/invisible_man.jpg'));
    _movieData.add(BannerSliderModel(
        id: 4, name: 'Peninsula', image: '$globalUrl/movie/peninsula.jpg'));
    _movieData.add(BannerSliderModel(
        id: 5,
        name: 'Train to Busan',
        image: '$globalUrl/movie/train_to_busan.jpg'));
    _movieData.add(BannerSliderModel(
        id: 6, name: 'Venom', image: '$globalUrl/movie/venom.jpg'));
    _movieData.add(BannerSliderModel(
        id: 7, name: '#Alive', image: '$globalUrl/movie/alive.jpg'));
    _movieData.add(BannerSliderModel(
        id: 8,
        name: 'Avengers: Endgame',
        image: '$globalUrl/movie/avenger.jpg'));

    _movieTitle = _movieData[0].name!;

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
        appBar: AppBar(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey[100],
                  height: 1.0,
                )),
            title: Image.asset('assets/images/logo_horizontal.png', height: 24),
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.account_circle, color: _color1),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Click account', toastLength: Toast.LENGTH_SHORT);
                }),
            actions: <Widget>[
              IconButton(
                  icon: _globalWidget.customNotifIcon(
                      count: 8, notifColor: _color1, labelColor: _color3),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: 'Click notification',
                        toastLength: Toast.LENGTH_SHORT);
                  }),
            ]),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                    msg: 'Click location', toastLength: Toast.LENGTH_SHORT);
              },
              child: Container(
                color: Colors.grey[100],
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        const Text('NEW YORK')
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey[700])
                  ],
                ),
              ),
            ),
            _buildHomeBanner(),
            _nowShowing(),
            _movieNews(),
            _comingSoon()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          selectedFontSize: 8,
          unselectedFontSize: 8,
          iconSize: 28,
          selectedLabelStyle: TextStyle(
              color: _currentIndex == 1 ? _color3 : _color1,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(color: _color2, fontWeight: FontWeight.bold),
          selectedItemColor: _currentIndex == 1 ? _color3 : _color1,
          unselectedItemColor: _color2,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home,
                    color: _currentIndex == 0 ? _color1 : _color2)),
            BottomNavigationBarItem(
                label: 'Cinema',
                icon: Icon(Icons.movie,
                    color: _currentIndex == 1 ? _color3 : _color2)),
            BottomNavigationBarItem(
                label: 'Ticket',
                icon: Icon(Icons.label,
                    color: _currentIndex == 2 ? _color1 : _color2))
          ],
        ));
  }

  Widget _buildHomeBanner() {
    return Stack(
      children: [
        CarouselSlider(
          items: _bannerData
              .map((item) => GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Click banner ${item.id}',
                        toastLength: Toast.LENGTH_SHORT);
                  },
                  child: buildCacheNetworkImage(
                      width: 1000, height: 0, url: item.image)))
              .toList(),
          options: CarouselOptions(
              aspectRatio: 2.5,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageSlider = index;
                });
              }),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bannerData.map((item) {
              int index = _bannerData.indexOf(item);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: _currentImageSlider == index ? 10 : 5,
                height: _currentImageSlider == index ? 10 : 5,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _nowShowing() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Now Showing',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Text('View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
        ),
        CarouselSlider(
          items: _movieData
              .map((item) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: buildCacheNetworkImage(height: 350, url: item.image),
                  ))
              .toList(),
          options: CarouselOptions(
              height: 350,
              viewportFraction: 0.62,
              autoPlay: false,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _movieTitle = _movieData[index].name!;
                });
              }),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Text(_movieTitle,
              style: TextStyle(
                  fontSize: 28, color: _color2, fontWeight: FontWeight.bold)),
        ),
        Divider(color: Colors.grey[300])
      ],
    );
  }

  Widget _movieNews() {
    double boxSize = MediaQuery.of(context).size.width / 4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Movie News',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Text('View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: List.generate(5, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: 'Click ${_movieData[index].name!}',
                          toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Container(
                      height: boxSize,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              child: buildCacheNetworkImage(
                                  width: boxSize,
                                  height: boxSize,
                                  url: _movieData[index].image)),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'This movie has a title, and the title of this movie is ${_movieData[index].name!}',
                                  style:
                                      TextStyle(fontSize: 14, color: _color2),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.visibility,
                                        color: Colors.grey, size: 11),
                                    SizedBox(width: 2),
                                    Text('134',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11)),
                                    SizedBox(width: 8),
                                    Icon(Icons.thumb_up,
                                        color: Colors.grey, size: 11),
                                    SizedBox(width: 2),
                                    Text('20',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11)),
                                    Spacer(),
                                    Text('1 week ago',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  (index == _bannerData.length - 1)
                      ? const Wrap()
                      : Divider(
                          height: 0,
                          color: Colors.grey[400],
                        )
                ],
              );
            }),
          ),
        ),
        Divider(color: Colors.grey[300])
      ],
    );
  }

  Widget _comingSoon() {
    double boxSize = MediaQuery.of(context).size.width / 2.4;
    if (kIsWeb) {
      boxSize = 180;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Coming Soon',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Text('View All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 330,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: _movieData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: boxSize,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Click ${_movieData[index].name!}',
                        toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: buildCacheNetworkImage(
                              width: boxSize, url: _movieData[index].image)),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _movieData[index].name!,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
