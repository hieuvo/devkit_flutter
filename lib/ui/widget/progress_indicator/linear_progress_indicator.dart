import 'dart:async';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  const LinearProgressIndicatorPage({super.key});

  @override
  State<LinearProgressIndicatorPage> createState() =>
      _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState
    extends State<LinearProgressIndicatorPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Timer? _timer;
  double _progress = 0;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        if (_progress >= 1) {
          _cancelTimer();
        } else {
          _progress += 0.01;
        }
      });
    });
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
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
              _globalWidget.createDetailWidget(
                  title: 'Linear Progress Indicator',
                  desc: 'This is the example of linear progress indicator'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const LinearProgressIndicator(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const LinearProgressIndicator(
                  minHeight: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text('With value'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor: Colors.cyanAccent,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    value: _progress,
                  ),
                  const SizedBox(height: 16),
                  _globalWidget.createButton(
                      buttonName: 'Start timer',
                      onPressed: () {
                        if (_timer == null) {
                          _progress = 0;
                          _startTimer();
                        }
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}
