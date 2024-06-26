import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScrollbar1Page extends StatefulWidget {
  const CupertinoScrollbar1Page({super.key});

  @override
  State<CupertinoScrollbar1Page> createState() => _CupertinoScrollbar1PageState();
}

class _CupertinoScrollbar1PageState extends State<CupertinoScrollbar1Page> {
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
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: _globalWidget.createDetailWidget(
                      title: 'Cupertino Scrollbar 1 - Standart',
                      desc: 'This is the example of standart Cupertino Scrollbar'
                  ),
                ),
                Column(
                  children: List.generate(100, (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('index $index'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
