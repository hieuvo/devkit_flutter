import 'package:flutter/material.dart';

class TabbarWithControllerPage extends StatefulWidget {
  const TabbarWithControllerPage({super.key});

  @override
  State<TabbarWithControllerPage> createState() =>
      _TabbarWithControllerPageState();
}

class _TabbarWithControllerPageState extends State<TabbarWithControllerPage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  late TabController _tabController;

  final List<Tab> _tabBarList = [
    const Tab(text: 'Tab 1'),
    const Tab(child: Text('Tab 2')),
    const Tab(text: 'Tab 3'),
  ];

  final List<Widget> _tabContentList = <Widget>[
    const Center(
      child: Text('Content 1'),
    ),
    const Center(
      child: Text('Content 2'),
    ),
    const Center(
      child: Text('Content 3'),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(
        vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "TabBar with Controller",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            onTap: (position) {
              setState(() {
                _tabIndex = position;
              });
              debugPrint('idx : $_tabIndex');
            },
            tabs: _tabBarList,
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: DefaultTabController(
          length: _tabBarList.length,
          child: TabBarView(
            controller: _tabController,
            children: _tabContentList.map((Widget content) {
              return content;
            }).toList(),
          ),
        ));
  }
}
