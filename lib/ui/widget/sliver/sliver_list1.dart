import 'package:flutter/material.dart';

class SliverList1Page extends StatefulWidget {
  const SliverList1Page({super.key});

  @override
  State<SliverList1Page> createState() => _SliverList1PageState();
}

class _SliverList1PageState extends State<SliverList1Page> {
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
              title: Text('Sliver List Method 1'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
                delegate: SliverChildListDelegate(_buildList(50))
            ),
          ],
        )
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      listItems.add(Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
              'Item $i',
              style: const TextStyle(fontSize: 16.0)
          )
      ));
    }
    return listItems;
  }
}
