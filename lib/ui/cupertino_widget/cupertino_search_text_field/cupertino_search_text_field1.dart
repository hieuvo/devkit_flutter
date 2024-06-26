import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSearchTextField1Page extends StatefulWidget {
  const CupertinoSearchTextField1Page({super.key});

  @override
  State<CupertinoSearchTextField1Page> createState() => _CupertinoSearchTextField1PageState();
}

class _CupertinoSearchTextField1PageState extends State<CupertinoSearchTextField1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
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
                    title: 'Cupertino Search Text Field 1 - Standart',
                    desc: 'This is the example of standart Cupertino Search Text Field'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CupertinoSearchTextField(
                    controller: _textController,
                    onChanged: (String value) {
                      //debugPrint('The text has changed to: $value');
                    },
                    onSubmitted: (String value) {
                      //debugPrint('Submitted text: $value');
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
