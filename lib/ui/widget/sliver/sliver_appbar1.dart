import 'package:flutter/material.dart';

class SliverAppbar1Page extends StatefulWidget {
  const SliverAppbar1Page({super.key});

  @override
  State<SliverAppbar1Page> createState() => _SliverAppbar1PageState();
}

class _SliverAppbar1PageState extends State<SliverAppbar1Page> {
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
              title: Text('title app bar'),
              floating: true,
              flexibleSpace: Placeholder(),
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
