import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar6Page extends StatefulWidget {
  const CupertinoNavigationBar6Page({super.key});

  @override
  State<CupertinoNavigationBar6Page> createState() => _CupertinoNavigationBar6PageState();
}

class _CupertinoNavigationBar6PageState extends State<CupertinoNavigationBar6Page> {
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
                    title: 'Cupertino Navigation Bar 6 - Multi Icon',
                    desc: 'This is the example of Cupertino Navigation Bar with multi icon'
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoNavigationBar(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: const Icon(Icons.arrow_back_ios),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      GestureDetector(
                        child: const Icon(Icons.menu),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  middle: const Text('Add Image'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text('Done'),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      GestureDetector(
                        child: const Icon(Icons.filter_list_outlined),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
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
