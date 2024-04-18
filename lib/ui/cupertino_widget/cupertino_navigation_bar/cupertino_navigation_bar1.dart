import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar1Page extends StatefulWidget {
  const CupertinoNavigationBar1Page({super.key});

  @override
  State<CupertinoNavigationBar1Page> createState() => _CupertinoNavigationBar1PageState();
}

class _CupertinoNavigationBar1PageState extends State<CupertinoNavigationBar1Page> {
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
                    title: 'Cupertino Navigation Bar 1 - Standart',
                    desc: 'This is the example of standart Cupertino Navigation Bar'
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const CupertinoNavigationBar(
                  middle: Text('Add Image'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
