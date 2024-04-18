import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField8Page extends StatefulWidget {
  const CupertinoTextField8Page({super.key});

  @override
  State<CupertinoTextField8Page> createState() => _CupertinoTextField8PageState();
}

class _CupertinoTextField8PageState extends State<CupertinoTextField8Page> {
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
                    title: 'Cupertino Text Field 8 - Multi Line',
                    desc: 'This is the example of Cupertino Text Field with multi line'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Address',
                  padding: EdgeInsets.all(16),
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
