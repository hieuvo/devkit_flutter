import 'package:flutter/material.dart';

class SliverList3Page extends StatefulWidget {
  const SliverList3Page({super.key});

  @override
  State<SliverList3Page> createState() => _SliverList3PageState();
}

class _SliverList3PageState extends State<SliverList3Page> {
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
              title: Text('Sliver List Method 3'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    [
                      Container(
                        color: Colors.red,
                        height: 150.0,
                        child: const Center(child: Text('Item 1')),
                      ),
                      Container(
                        color: Colors.purple,
                        height: 150.0,
                        child: const Center(child: Text('Item 2')),
                      ),
                      Container(
                        color: Colors.green,
                        height: 150.0,
                        child: const Center(child: Text('Item 3')),
                      ),
                      Container(
                        color: Colors.red,
                        height: 150.0,
                        child: const Center(child: Text('Item 1')),
                      ),
                      Container(
                        color: Colors.purple,
                        height: 150.0,
                        child: const Center(child: Text('Item 2')),
                      ),
                      Container(
                        color: Colors.green,
                        height: 150.0,
                        child: const Center(child: Text('Item 3')),
                      ),
                      Container(
                        color: Colors.red,
                        height: 150.0,
                        child: const Center(child: Text('Item 1')),
                      ),
                      Container(
                        color: Colors.purple,
                        height: 150.0,
                        child: const Center(child: Text('Item 2')),
                      ),
                      Container(
                        color: Colors.green,
                        height: 150.0,
                        child: const Center(child: Text('Item 3')),
                      ),
                    ]
                )
            ),
          ],
        )
    );
  }
}
