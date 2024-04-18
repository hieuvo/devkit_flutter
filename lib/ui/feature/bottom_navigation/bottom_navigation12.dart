import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/reusable/nav_page1.dart';
import 'package:devkitflutter/ui/reusable/nav_page2.dart';
import 'package:devkitflutter/ui/reusable/nav_page3.dart';
import 'package:devkitflutter/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';

class BottomNavigation12Page extends StatefulWidget {
  const BottomNavigation12Page({super.key});

  @override
  State<BottomNavigation12Page> createState() => _BottomNavigation12PageState();
}

class _BottomNavigation12PageState extends State<BottomNavigation12Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late PageController _pageController;

  // Pages if you click bottom navigation
  final List<Widget> _contentPages = <Widget>[
    const NavPage1(),
    const NavPage2(),
    const NavPage3(),
    const NavPage4(),
  ];

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_handleTabSelection);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _contentPages.map((Widget content) {
          return content;
        }).toList(),
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        const {2: 'hot', 3:'99+'},
        badgePadding: const EdgeInsets.only(left: 7, right: 7),
        badgeColor: Colors.red,
        badgeBorderRadius: 20,
        badgeMargin: const EdgeInsets.only(bottom: 20, left: 40),
        style: TabStyle.react,
        backgroundColor: const Color(0xFF8bc34a),
        color: Colors.white,
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.home, title: 'Nav 1'),
          TabItem(icon: Icons.favorite, title: 'Nav 2'),
          TabItem(icon: Icons.notifications, title: 'Nav 3'),
          TabItem(icon: Icons.person, title: 'Nav 4'),
        ],
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i){
          _tapNav(i);
        },
      ),
    );
  }

  void _tapNav(index){
    _pageController.jumpToPage(index);

    // this unfocus is to prevent show keyboard in the text field
    FocusScope.of(context).unfocus();
  }
}