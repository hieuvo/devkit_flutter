import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  const CupertinoActivityIndicatorPage({super.key});

  @override
  State<CupertinoActivityIndicatorPage> createState() => _CupertinoActivityIndicatorPageState();
}

class _CupertinoActivityIndicatorPageState extends State<CupertinoActivityIndicatorPage> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _globalWidget.createDetailWidget2(
                title: 'Cupertino Activity Indicator',
                desc: 'An iOS-style activity indicator. Displays a circular \'spinner\'.',
                icon: Icons.refresh
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text('Standart'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const CupertinoActivityIndicator(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Without Animation'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const CupertinoActivityIndicator(
                animating: false,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Size'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const CupertinoActivityIndicator(
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
