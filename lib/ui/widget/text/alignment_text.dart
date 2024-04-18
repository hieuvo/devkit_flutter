import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AlignmentTextPage extends StatefulWidget {
  const AlignmentTextPage({super.key});

  @override
  State<AlignmentTextPage> createState() => _AlignmentTextPageState();
}

class _AlignmentTextPageState extends State<AlignmentTextPage> {
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
          children: [
            _globalWidget.createDetailWidget(
                title: 'Alignment Text',
                desc: 'This is the example of text with alignment'
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        )
    );
  }
}
