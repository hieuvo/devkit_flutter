import 'package:flutter/material.dart';

class SliverList2Page extends StatefulWidget {
  const SliverList2Page({super.key});

  @override
  State<SliverList2Page> createState() => _SliverList2PageState();
}

class _SliverList2PageState extends State<SliverList2Page> {
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
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Sliver List Method 2'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #${index+1}'));
              },
                childCount: 100,
              ),
            ),
          ],
        )
    );
  }
}
