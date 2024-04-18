import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/reusable/nav_page1.dart';
import 'package:devkitflutter/ui/reusable/nav_page2.dart';
import 'package:devkitflutter/ui/reusable/nav_page3.dart';
import 'package:devkitflutter/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';

class BottomNavigation1Page extends StatefulWidget {
  const BottomNavigation1Page({super.key});

  @override
  State<BottomNavigation1Page> createState() => _BottomNavigation1PageState();
}

class _BottomNavigation1PageState extends State<BottomNavigation1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _color1 = const Color(0xFF0181cc);
  final Color _color2 = const Color(0xFF515151);
  final Color _color3 = const Color(0xFFe75f3f);

  late PageController _pageController;
  int _currentIndex = 0;

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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            _pageController.jumpToPage(value);

            // this unfocus is to prevent show keyboard in the text field
            FocusScope.of(context).unfocus();
          },
          selectedFontSize: 8,
          unselectedFontSize: 8,
          iconSize: 28,
          selectedLabelStyle: TextStyle(color: _currentIndex == 1 ? _color3 : _color1, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: _color2, fontWeight: FontWeight.bold),
          selectedItemColor: _currentIndex == 1 ? _color3 : _color1,
          unselectedItemColor: _color2,
          items: [
            BottomNavigationBarItem(
                label: 'Nav 1',
                icon: Icon(
                    Icons.home,
                    color: _currentIndex == 0 ? _color1 : _color2
                ),
            ),
            BottomNavigationBarItem(
                label: 'Nav 2',
                icon: Icon(
                    Icons.favorite,
                    color: _currentIndex == 1 ? _color3 : _color2
                )
            ),
            BottomNavigationBarItem(
                label: 'Nav 3',
                icon: Icon(
                    Icons.notifications,
                    color: _currentIndex == 2 ? _color1 : _color2
                )
            ),
            BottomNavigationBarItem(
                label: 'Nav 4',
                icon: Icon(
                    Icons.person_outline,
                    color: _currentIndex == 3 ? _color1 : _color2
                )
            ),
          ],
        )
    );
  }
}
