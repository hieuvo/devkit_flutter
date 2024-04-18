import 'dart:async';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  const CircularProgressIndicatorPage({super.key});

  @override
  State<CircularProgressIndicatorPage> createState() =>
      _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState
    extends State<CircularProgressIndicatorPage> {
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
                  title: 'Circular Progress Indicator',
                  desc: 'This is the example of circular progress indicator'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CircularProgressIndicator(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CircularProgressIndicator(
                  strokeWidth: 16,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text('With value'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    backgroundColor: Colors.cyanAccent,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    value: _progress,
                  ),
                  const SizedBox(width: 16),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const SizedBox(
                    width: 200, child: CircularProgressIndicator()),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const SizedBox(
                    height: 200, child: CircularProgressIndicator()),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator()),
              ),
            ],
          ),
        ));
  }
}
