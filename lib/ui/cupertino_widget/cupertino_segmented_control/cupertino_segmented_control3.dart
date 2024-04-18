import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControl3Page extends StatefulWidget {
  const CupertinoSegmentedControl3Page({super.key});

  @override
  State<CupertinoSegmentedControl3Page> createState() => _CupertinoSegmentedControl3PageState();
}

class _CupertinoSegmentedControl3PageState extends State<CupertinoSegmentedControl3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _selectedIndex = 0;
  final Map<int, Widget> _map = {
    0: const Text('Option 1'),
    1: const Text('Option 2'),
    2: const Text('Option 3'),
  };

  @override
  void initState() {
    super.initState();

    _map.putIfAbsent(4, () => const Text('Option 4'));
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
                    title: 'Cupertino Segmented Control 3 - with Map',
                    desc: 'This is the example of Cupertino Segmented Control with map'
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSegmentedControl<int>(
                  groupValue: _selectedIndex,
                  children: _map,
                  onValueChanged: (groupValue) {
                    setState(() {
                      _selectedIndex = groupValue;
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
