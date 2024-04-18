import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField1Page extends StatefulWidget {
  const CupertinoTextField1Page({super.key});

  @override
  State<CupertinoTextField1Page> createState() => _CupertinoTextField1PageState();
}

class _CupertinoTextField1PageState extends State<CupertinoTextField1Page> {
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
                    title: 'Cupertino Text Field 1 - Standart',
                    desc: 'This is the example of standart Cupertino Text Field'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
