library sk_onboarding_screen;

import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:devkitflutter/library/sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:universal_io/io.dart' as io;

class SKOnboardingScreen extends StatefulWidget {
  final List<SkOnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  const SKOnboardingScreen({
    super.key,
    required this.pages,
    required this.bgColor,
    required this.themeColor,
    required this.skipClicked,
    required this.getStartedClicked,
  });

  @override
  SKOnboardingScreenState createState() => SKOnboardingScreenState();
}

class SKOnboardingScreenState extends State<SKOnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnboardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i]));
    }
    return children;
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? widget.themeColor : const Color(0xFF929794),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.width / 0.8;
    if (!io.Platform.isIOS && !io.Platform.isAndroid) {
      pageHeight = MediaQuery.of(context).size.height / 1.3;
    }
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        widget.skipClicked("Skip Tapped");
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),
                Container(
                  height: pageHeight,
                  color: Colors.transparent,
                  child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: buildOnboardingPages()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != widget.pages.length - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: FloatingActionButton(
                              backgroundColor: widget.bgColor,
                              child: Icon(
                                Icons.arrow_forward,
                                color: widget.themeColor,
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : const Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    double size = MediaQuery.of(context).size.width / 1.5;
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: (page.imageAssetPath != null)
                  ? Image.asset(page.imageAssetPath!, width: size, height: size)
                  : buildCacheNetworkImage(
                      width: size,
                      height: size,
                      url: page.imageFromUrl,
                      plColor: Colors.transparent),
            ),
            const SizedBox(height: 30.0),
            Text(
              page.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: page.titleColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              page.description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: page.descripColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = GestureDetector(
      onTap: _getStartedTapped,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: widget.themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

    return Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 5.0, bottom: 30.0),
        child: loginButtonWithGesture);
  }

  void _getStartedTapped() {
    widget.getStartedClicked("Get Started Tapped");
  }
}
