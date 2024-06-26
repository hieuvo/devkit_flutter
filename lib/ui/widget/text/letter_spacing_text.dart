import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LetterSpacingTextPage extends StatefulWidget {
  const LetterSpacingTextPage({super.key});

  @override
  State<LetterSpacingTextPage> createState() => _LetterSpacingTextPageState();
}

class _LetterSpacingTextPageState extends State<LetterSpacingTextPage> {
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
                title: 'Letter Spacing Text',
                desc: 'This is the example of text with different space of each letter'
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 4
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 6.5
              )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 8
              )),
            ),
          ],
        )
    );
  }
}
