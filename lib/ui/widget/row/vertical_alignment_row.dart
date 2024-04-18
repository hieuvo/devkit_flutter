import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class VerticalAlignmentRowPage extends StatefulWidget {
  const VerticalAlignmentRowPage({super.key});

  @override
  State<VerticalAlignmentRowPage> createState() => _VerticalAlignmentRowPageState();
}

class _VerticalAlignmentRowPageState extends State<VerticalAlignmentRowPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _outerBoxColor = Colors.grey[400]!;
  final Color _leftBoxColor = Colors.indigoAccent;
  final Color _middleBoxColor = Colors.orange;
  final Color _rightBoxColor = Colors.pinkAccent;
  final Color _textColor = Colors.white;

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
                title: 'Vertical Alignment Row',
                desc: 'This is the example of vertical alignment in Row Widget'
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Align Top')
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Align Center')
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Align Bottom')
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Align Top & fill all')
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
