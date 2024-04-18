import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlidingSegmentedControl2Page extends StatefulWidget {
  const CupertinoSlidingSegmentedControl2Page({super.key});

  @override
  State<CupertinoSlidingSegmentedControl2Page> createState() => _CupertinoSlidingSegmentedControl2PageState();
}

class _CupertinoSlidingSegmentedControl2PageState extends State<CupertinoSlidingSegmentedControl2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int? _groupValue = 0;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Sliding Segmented Control 2 - with Properties',
                    desc: 'This is the example of Cupertino Sliding Segmented Control with properties'
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: Colors.pinkAccent,
                  thumbColor: Colors.blueAccent,
                  groupValue: _groupValue,
                  children: const {
                    0: Text('Option 1'),
                    1: Text('Option 2'),
                    2: Text('Option 3'),
                  },
                  onValueChanged: (groupValue) {
                    //debugPrint(groupValue);
                    setState(() {
                      _groupValue = groupValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
