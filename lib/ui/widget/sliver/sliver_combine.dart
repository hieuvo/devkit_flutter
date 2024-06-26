import 'package:flutter/material.dart';

class SliverCombinePage extends StatefulWidget {
  const SliverCombinePage({super.key});

  @override
  State<SliverCombinePage> createState() => _SliverCombinePageState();
}

class _SliverCombinePageState extends State<SliverCombinePage> {
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
              title: Text('Sliver Combine'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #${index+1}'));
              },
                childCount: 20,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ) ,
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: _randomColor(index),
                  child: Center(
                    child: Text((index+1).toString()),
                  ),
                );
              }, childCount: 20,),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.all(16),
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 2.0,
                  ),
                ),
              )
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
