import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar7Page extends StatefulWidget {
  const CupertinoNavigationBar7Page({super.key});

  @override
  State<CupertinoNavigationBar7Page> createState() => _CupertinoNavigationBar7PageState();
}

class _CupertinoNavigationBar7PageState extends State<CupertinoNavigationBar7Page> {
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Navigation Bar 7 - Background Color',
                    desc: 'This is the example of Cupertino Navigation Bar with background color'
                ),
              ),
              Container(
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoNavigationBar(
                  backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
                  middle: const Text('Add Image'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
