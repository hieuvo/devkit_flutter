import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ReverseListviewPage extends StatefulWidget {
  const ReverseListviewPage({super.key});

  @override
  State<ReverseListviewPage> createState() => _ReverseListviewPageState();
}

class _ReverseListviewPageState extends State<ReverseListviewPage> {
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
          reverse: true,
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
