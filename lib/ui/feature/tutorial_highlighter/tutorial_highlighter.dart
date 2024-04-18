/*
https://pub.dev/packages/highlighter_coachmark
*/
import 'dart:async';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:devkitflutter/library/highlighter_coachmark/highlighter_coachmark.dart';

class TutorialHighlighterPage extends StatefulWidget {
  const TutorialHighlighterPage({super.key});

  @override
  State<TutorialHighlighterPage> createState() => _TutorialHighlighterPageState();
}

class _TutorialHighlighterPageState extends State<TutorialHighlighterPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final GlobalKey _fabKey = const GlobalObjectKey("fab");
  final GlobalKey _buttonKey = const GlobalObjectKey("button");

  @override
  void initState() {
    Timer(const Duration(milliseconds: 300), () => showCoachMarkFAB());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showCoachMarkFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext!.findRenderObject() as RenderBox;

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(
        center: markRect.center, radius: markRect.longestSide * 0.6);

    coachMarkFAB.show(
        targetContext: _fabKey.currentContext!,
        markRect: markRect,
        children: [
          const Center(
              child: Text("This is FAB Button",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: null,
        onClose: () {
          // after fab tutorial close, run tutorial for button
          Timer(const Duration(milliseconds: 300), () => showCoachMarkButton());
        });
  }

  void showCoachMarkButton() {
    CoachMark coachMarkTile = CoachMark();
    RenderBox target = _buttonKey.currentContext!.findRenderObject() as RenderBox;

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = markRect.inflate(5.0);

    coachMarkTile.show(
        targetContext: _fabKey.currentContext!,
        markRect: markRect,
        markShape: BoxShape.rectangle,
        children: [
          Positioned(
              top: markRect.bottom + 15.0,
              right: 5.0,
              child: const Text("This is Button 1",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )))
        ],
        duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Tutorial Highlighter',
                  desc: 'This is the example of tutorial'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextButton(
                    key: _buttonKey,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => Colors.blue,
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          )
                      ),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: 'This is Button 1',
                          toastLength: Toast.LENGTH_LONG);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Button 1',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: _fabKey,
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
