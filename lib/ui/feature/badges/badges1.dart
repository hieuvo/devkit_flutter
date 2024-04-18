/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges1Page extends StatefulWidget {
  const Badges1Page({super.key});

  @override
  State<Badges1Page> createState() => _Badges1PageState();
}

class _Badges1PageState extends State<Badges1Page> {
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
                  title: 'Badges 1 - Standart',
                  desc: 'This is the example of standart badges'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const badges.Badge(
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
