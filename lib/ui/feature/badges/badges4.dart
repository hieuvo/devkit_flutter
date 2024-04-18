/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges4Page extends StatefulWidget {
  const Badges4Page({super.key});

  @override
  State<Badges4Page> createState() => _Badges4PageState();
}

class _Badges4PageState extends State<Badges4Page> {
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
                  title: 'Badges 4 - Color',
                  desc: 'This is the example of badges color'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.all(6),
                ),
                badgeContent: Text('7'),
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
