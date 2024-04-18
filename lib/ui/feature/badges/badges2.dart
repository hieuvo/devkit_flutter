/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges2Page extends StatefulWidget {
  const Badges2Page({super.key});

  @override
  State<Badges2Page> createState() => _Badges2PageState();
}

class _Badges2PageState extends State<Badges2Page> {
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
                  title: 'Badges 2 - Chip',
                  desc: 'This is the example of chip badges'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(0),
                  shape: badges.BadgeShape.square,
                ),
                badgeContent: const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(2),
                  shape: badges.BadgeShape.square,
                ),
                badgeContent: const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(4),
                  shape: badges.BadgeShape.square,
                ),
                badgeContent: const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(6),
                  shape: badges.BadgeShape.square,
                ),
                badgeContent: const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(8),
                  shape: badges.BadgeShape.square,
                ),
                badgeContent: const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
