/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges7Page extends StatefulWidget {
  const Badges7Page({super.key});

  @override
  State<Badges7Page> createState() => _Badges7PageState();
}

class _Badges7PageState extends State<Badges7Page> {
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
                  title: 'Badges 7 - Rectangle',
                  desc: 'This is the example of rectangle badges'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -12, end: -20),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  padding: const EdgeInsets.all(2),
                  borderRadius: BorderRadius.circular(5),
                ),
                badgeContent: const Text(
                  'NEW',
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                child: Text(
                  'SOFTWARE',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
