import 'package:flutter/material.dart';

class TabbarWithScrollPage extends StatefulWidget {
  const TabbarWithScrollPage({super.key});

  @override
  State<TabbarWithScrollPage> createState() => _TabbarWithScrollPageState();
}

class _TabbarWithScrollPageState extends State<TabbarWithScrollPage> {
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
      length: 20,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "TabBar with Scroll",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(child: Text('Tab 2')),
                Tab(text: 'Tab 3'),
                Tab(text: 'Tab 4'),
                Tab(text: 'Tab 5'),
                Tab(text: 'Tab 6'),
                Tab(text: 'Tab 7'),
                Tab(text: 'Tab 8'),
                Tab(text: 'Tab 9'),
                Tab(text: 'Tab 10'),
                Tab(text: 'Tab 11'),
                Tab(text: 'Tab 12'),
                Tab(text: 'Tab 13'),
                Tab(text: 'Tab 14'),
                Tab(text: 'Tab 15'),
                Tab(text: 'Tab 16'),
                Tab(text: 'Tab 17'),
                Tab(text: 'Tab 18'),
                Tab(text: 'Tab 19'),
                Tab(text: 'Tab 20'),
              ],
              isScrollable: true,
            ),
            backgroundColor: Colors.pinkAccent,
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
              Center(
                child: Text('Content 4'),
              ),
              Center(
                child: Text('Content 5'),
              ),
              Center(
                child: Text('Content 6'),
              ),
              Center(
                child: Text('Content 7'),
              ),
              Center(
                child: Text('Content 8'),
              ),
              Center(
                child: Text('Content 9'),
              ),
              Center(
                child: Text('Content 10'),
              ),
              Center(
                child: Text('Content 11'),
              ),
              Center(
                child: Text('Content 12'),
              ),
              Center(
                child: Text('Content 13'),
              ),
              Center(
                child: Text('Content 14'),
              ),
              Center(
                child: Text('Content 15'),
              ),
              Center(
                child: Text('Content 16'),
              ),
              Center(
                child: Text('Content 17'),
              ),
              Center(
                child: Text('Content 18'),
              ),
              Center(
                child: Text('Content 19'),
              ),
              Center(
                child: Text('Content 20'),
              ),
            ],
          )),
    );
  }
}
