import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ListviewWithGeneratePage extends StatefulWidget {
  const ListviewWithGeneratePage({super.key});

  @override
  State<ListviewWithGeneratePage> createState() => _ListviewWithGeneratePageState();
}

class _ListviewWithGeneratePageState extends State<ListviewWithGeneratePage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: List.generate(100, (index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('index $index'),
            );
          }),
        )
    );
  }
}
