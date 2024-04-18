import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoPageRoutes2Page extends StatefulWidget {
  const CupertinoPageRoutes2Page({super.key});

  @override
  State<CupertinoPageRoutes2Page> createState() => _CupertinoPageRoutes2PageState();
}

class _CupertinoPageRoutes2PageState extends State<CupertinoPageRoutes2Page> {
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
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
