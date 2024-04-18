/*
This is sliver tab bar page
 */

import 'package:devkitflutter/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverTabbar2Page extends StatefulWidget {
  const SliverTabbar2Page({super.key});

  @override
  State<SliverTabbar2Page> createState() => _SliverTabbar2PageState();
}

class _SliverTabbar2PageState extends State<SliverTabbar2Page> with SingleTickerProviderStateMixin {
  late TabBar _tabBar;
  int _tabIndex = 0;
  late TabController _tabController;

  final List<Tab> _tabBarList = [
    const Tab( text: "Tab one"),
    const Tab( text: "Tab two"),
    const Tab( text: "Tab three"),
    const Tab( text: "Tab four")
  ];

  final List<Widget> _tabContentList = <Widget>[
    ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text('Tab 1 index ${index+1}'),
        );
      }),
    ),
    ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text('Tab 2 index ${index+1}'),
        );
      }),
    ),
    ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text('Tab 3 index ${index+1}'),
        );
      }),
    ),
    ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text('Tab 4 index ${index+1}'),
        );
      }),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);

    _tabBar = TabBar(
      controller: _tabController,
      onTap: (position){
        setState(() {
          _tabIndex = position;
        });
        //debugPrint('idx : '+_tabIndex.toString());
      },
      isScrollable: true,
      labelColor: black21,
      labelStyle: const TextStyle(fontSize: 14),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 4,
      indicatorColor: black21,
      unselectedLabelColor: softGrey,
      labelPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      tabs: _tabBarList,
    );

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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light
        ),
        child: DefaultTabController(
          length: _tabBarList.length,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      iconTheme: const IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                      floating: true,
                      pinned: true,
                      snap: false,
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      centerTitle: true,
                      title: Image.asset('assets/images/logo_horizontal.png', height: 24),
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(_tabBar.preferredSize.height+1),
                          child: Column(
                            children: [
                              _tabBar,
                              Container(
                                color: Colors.grey[200],
                                height: 1.0,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: _tabContentList.map((Widget content) {
                return content;
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
