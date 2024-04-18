import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBar1Page extends StatefulWidget {
  const CupertinoTabBar1Page({super.key});

  @override
  State<CupertinoTabBar1Page> createState() => _CupertinoTabBar1PageState();
}

class _CupertinoTabBar1PageState extends State<CupertinoTabBar1Page> {
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
            onTap: (){
              Navigator.pop(context);
            },
          ),
          middle: const Text('Cupertino Tab Bar'),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
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
          tabBuilder: (context, index){
            switch(index){
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
