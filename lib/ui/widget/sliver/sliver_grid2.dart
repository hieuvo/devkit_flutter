import 'package:flutter/material.dart';

class SliverGrid2Page extends StatefulWidget {
  const SliverGrid2Page({super.key});

  @override
  State<SliverGrid2Page> createState() => _SliverGrid2PageState();
}

class _SliverGrid2PageState extends State<SliverGrid2Page> {
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
              title: Text('Sliver Grid 2'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ) ,
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(
                    color: _randomColor(index),
                    child: Center(
                      child: Text((index+1).toString()),
                    ),
                  );
                }, childCount: 52,),
              ),
            ),
          ],
        )
    );
  }

  Color _randomColor(int index) {
    if (index % 3 == 0) {
      return Colors.yellow;
    } else if (index % 3 == 1) {
      return Colors.green;
    }
    return Colors.pinkAccent;
  }
}
