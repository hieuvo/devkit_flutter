import 'package:flutter/material.dart';

class StandartTabbarPage extends StatefulWidget {
  const StandartTabbarPage({super.key});

  @override
  State<StandartTabbarPage> createState() => _StandartTabbarPageState();
}

class _StandartTabbarPageState extends State<StandartTabbarPage> {
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
              "Standart TabBar",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(child: Text('Tab 2')),
                Tab(text: 'Tab 3'),
              ],
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
            ],
          )),
    );
  }
}
