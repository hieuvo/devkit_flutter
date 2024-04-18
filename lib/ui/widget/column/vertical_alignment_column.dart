import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class VerticalAlignmentColumnPage extends StatefulWidget {
  const VerticalAlignmentColumnPage({super.key});

  @override
  State<VerticalAlignmentColumnPage> createState() => _VerticalAlignmentColumnPageState();
}

class _VerticalAlignmentColumnPageState extends State<VerticalAlignmentColumnPage> {
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
                title: 'Vertical Alignment Column',
                desc: 'This is the example of vertical alignment in Column Widget'
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Align top')
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Align center')
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Align bottom')
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
