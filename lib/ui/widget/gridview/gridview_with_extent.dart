import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GridviewWithExtentPage extends StatefulWidget {
  const GridviewWithExtentPage({super.key});

  @override
  State<GridviewWithExtentPage> createState() => _GridviewWithExtentPageState();
}

class _GridviewWithExtentPageState extends State<GridviewWithExtentPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
        appBar: _globalWidget.globalAppBar(),
        body: GridView.extent(
          padding: const EdgeInsets.all(8),
          maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.yellow,
              child: const Text('First', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: const Text('Second', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: const Text('Third', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(8),
              color: Colors.yellow,
              child: const Text('Four', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.all(8),
              color: Colors.yellow,
              child: const Text('Fifth', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(8),
              color: Colors.blue,
              child: const Text('Six', style: TextStyle(fontSize: 20)),
            ),
          ],
        )
    );
  }
}
