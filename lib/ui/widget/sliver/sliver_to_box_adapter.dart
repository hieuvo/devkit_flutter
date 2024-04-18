import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatefulWidget {
  const SliverToBoxAdapterPage({super.key});

  @override
  State<SliverToBoxAdapterPage> createState() => _SliverToBoxAdapterPageState();
}

class _SliverToBoxAdapterPageState extends State<SliverToBoxAdapterPage> {
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
              title: Text('Sliver To Box Adapter'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #${index+1}'));
              },
                childCount: 5,
              ),
            ),
            SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('I am bottom', style: TextStyle(
                      color: Colors.white
                    ))),
                  ),
                )
            ),
          ],
        )
    );
  }
}
