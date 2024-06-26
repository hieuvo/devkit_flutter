import 'package:flutter/material.dart';

class BottomTabbarPage extends StatefulWidget {
  const BottomTabbarPage({super.key});

  @override
  State<BottomTabbarPage> createState() => _BottomTabbarPageState();
}

class _BottomTabbarPageState extends State<BottomTabbarPage> {
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
          backgroundColor: Colors.pinkAccent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Bottom TabBar",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.pinkAccent,
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Content 1'),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Content 2'),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Content 3'),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(child: Text('Tab 2')),
              Tab(text: 'Tab 3'),
            ],
          )
      ),
    );
  }
}
