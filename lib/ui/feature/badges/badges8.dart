/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges8Page extends StatefulWidget {
  const Badges8Page({super.key});

  @override
  State<Badges8Page> createState() => _Badges8PageState();
}

class _Badges8PageState extends State<Badges8Page> {
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
                  title: 'Badges 8 - Only Badges',
                  desc: 'This is the example of only badges'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  elevation: 0,
                  shape: badges.BadgeShape.circle,
                  padding: EdgeInsets.all(7),
                ),
                badgeContent: Text(
                  '20',
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
