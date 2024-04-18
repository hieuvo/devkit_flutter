import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/reusable/ios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBar3Page extends StatefulWidget {
  const CupertinoTabBar3Page({super.key});

  @override
  State<CupertinoTabBar3Page> createState() => _CupertinoTabBar3PageState();
}

class _CupertinoTabBar3PageState extends State<CupertinoTabBar3Page> {
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                            'If you go to the next page, the tabbar will be dissapear',
                            textAlign: TextAlign.center)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: _globalWidget.createButton(
                          buttonName: 'Go To New Page 1',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IosPage()));
                          }),
                    ),
                  ],
                );
              case 1:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                            'If you go to the next page, the tabbar will be dissapear',
                            textAlign: TextAlign.center)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: _globalWidget.createButton(
                          buttonName: 'Go To New Page 2',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IosPage()));
                          }),
                    ),
                  ],
                );
              case 2:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                            'If you go to the next page, the tabbar will be dissapear',
                            textAlign: TextAlign.center)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: _globalWidget.createButton(
                          buttonName: 'Go To New Page 3',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IosPage()));
                          }),
                    ),
                  ],
                );
              case 3:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                            'If you go to the next page, the tabbar will be dissapear',
                            textAlign: TextAlign.center)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: _globalWidget.createButton(
                          buttonName: 'Go To New Page 4',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IosPage()));
                          }),
                    ),
                  ],
                );
              default:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                            'If you go to the next page, the tabbar will be dissapear',
                            textAlign: TextAlign.center)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: _globalWidget.createButton(
                          buttonName: 'Go To New Page 1',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const IosPage()));
                          }),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
