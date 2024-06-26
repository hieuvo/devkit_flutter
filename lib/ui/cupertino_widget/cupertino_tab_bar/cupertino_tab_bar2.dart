import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoTabBar2Page extends StatefulWidget {
  const CupertinoTabBar2Page({super.key});

  @override
  State<CupertinoTabBar2Page> createState() => _CupertinoTabBar2PageState();
}

class _CupertinoTabBar2PageState extends State<CupertinoTabBar2Page> {
  int _currentIndex = 1;
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
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: const Icon(CupertinoIcons.back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          middle: const Text('Cupertino Tab Bar'),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.pinkAccent,
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.green,
            iconSize: 12,
            border: const Border(
                top: BorderSide(
              width: 10,
              color: Colors.amber,
            )),
            currentIndex: _currentIndex,
            onTap: (index) {
              Fluttertoast.showToast(
                  msg: 'Press Index $index', toastLength: Toast.LENGTH_SHORT);
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Nav 1',
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                label: 'Nav 2',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Nav 3',
                icon: Icon(Icons.notifications_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Nav 4',
                icon: Icon(Icons.person_outline),
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Center(
                  child: Text('Page 1'),
                );
              case 1:
                return const Center(
                  child: Text('Page 2'),
                );
              case 2:
                return const Center(
                  child: Text('Page 3'),
                );
              case 3:
                return const Center(
                  child: Text('Page 4'),
                );
              default:
                return const Center(
                  child: Text('Page 1'),
                );
            }
          },
        ),
      ),
    );
  }
}
