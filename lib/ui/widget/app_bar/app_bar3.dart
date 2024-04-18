import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBar3Page extends StatefulWidget {
  const AppBar3Page({super.key});

  @override
  State<AppBar3Page> createState() => _AppBar3PageState();
}

class _AppBar3PageState extends State<AppBar3Page> {
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
                    title: 'App Bar 3 - Icon',
                    desc: 'This is the example of App Bar with icon'
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: AppBar(
                  title: const Text('Title'),
                  actions: [
                    IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press heart icon', toastLength: Toast.LENGTH_SHORT);
                        }),
                    IconButton(
                        icon: const Icon(Icons.help, color: Colors.black),
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press help icon', toastLength: Toast.LENGTH_SHORT);
                        }),
                  ],
                  centerTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
