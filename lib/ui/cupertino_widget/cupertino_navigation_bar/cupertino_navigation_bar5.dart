import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar5Page extends StatefulWidget {
  const CupertinoNavigationBar5Page({super.key});

  @override
  State<CupertinoNavigationBar5Page> createState() => _CupertinoNavigationBar5PageState();
}

class _CupertinoNavigationBar5PageState extends State<CupertinoNavigationBar5Page> {
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
                    title: 'Cupertino Navigation Bar 5 - Leading Icon',
                    desc: 'This is the example of Cupertino Navigation Bar with leading icon'
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoNavigationBar(
                  leading: GestureDetector(
                      child: const Icon(Icons.menu),
                      onTap: (){
                        Navigator.pop(context);
                      },
                  ),
                  middle: const Text('Add Image'),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Text('Done'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
