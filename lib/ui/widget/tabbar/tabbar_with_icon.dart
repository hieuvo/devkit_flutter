import 'package:flutter/material.dart';

class TabbarWithIconPage extends StatefulWidget {
  const TabbarWithIconPage({super.key});

  @override
  State<TabbarWithIconPage> createState() => _TabbarWithIconPageState();
}

class _TabbarWithIconPageState extends State<TabbarWithIconPage> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "TabBar with Icon",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.pinkAccent,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1', icon: Icon(Icons.home)),
                Tab(child: Text('Tab 2')),
                Tab(text: 'Tab 3', icon: Icon(Icons.android)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Content 1'),
              ),
              Center(
                child: Text('Content 2'),
              ),
              Center(
                child: Text('Content 3'),
              ),
            ],
          )),
    );
  }
}
