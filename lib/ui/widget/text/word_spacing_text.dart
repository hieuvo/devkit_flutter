import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class WordSpacingTextPage extends StatefulWidget {
  const WordSpacingTextPage({super.key});

  @override
  State<WordSpacingTextPage> createState() => _WordSpacingTextPageState();
}

class _WordSpacingTextPageState extends State<WordSpacingTextPage> {
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
                title: 'Word Spacing Text',
                desc: 'This is the example of text with different space of each word'
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 0
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 0.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 1
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 2.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 4
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 6.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  wordSpacing: 8
              )),
            ),
          ],
        )
    );
  }
}
