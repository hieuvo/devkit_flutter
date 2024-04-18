/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart' as badges;
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges3Page extends StatefulWidget {
  const Badges3Page({super.key});

  @override
  State<Badges3Page> createState() => _Badges3PageState();
}

class _Badges3PageState extends State<Badges3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _counter = 0;

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
                  title: 'Badges 3 - Animation',
                  desc: 'This is the example of badges with animation'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _addRemoveCartButtons(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: const badges.BadgeAnimation.slide(
                  animationDuration: Duration(milliseconds: 300),
                ),
                badgeContent: Text(
                  _counter.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: const badges.BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 300),
                ),
                badgeContent: Text(
                  _counter.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeAnimation: const badges.BadgeAnimation.scale(
                  animationDuration: Duration(milliseconds: 300),
                ),
                badgeContent: Text(
                  _counter.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add')),
          ElevatedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: const Icon(Icons.remove),
              label: const Text('Remove')),
        ],
      ),
    );
  }
}
