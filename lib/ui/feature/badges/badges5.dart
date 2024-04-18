/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges5Page extends StatefulWidget {
  const Badges5Page({super.key});

  @override
  State<Badges5Page> createState() => _Badges5PageState();
}

class _Badges5PageState extends State<Badges5Page> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Badges 5 - Position',
                  desc: 'This is the example of badges with position'
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("Top Left"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topStart(top: -5, start: -10),
                badgeContent: const Text('7'),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("Top Right"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -5, end: -20),
                badgeContent: const Text('7'),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("Bottom Left"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.bottomStart(bottom: -5, start: -10),
                badgeContent: const Text('7'),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("Bottom Right"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.bottomEnd(bottom: -5, end: -20),
                badgeContent: const Text('7'),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text("Center"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.center(),
                badgeContent: const Text('7', style: TextStyle(
                  color: Colors.white
                )),
                badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.all(2),
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
