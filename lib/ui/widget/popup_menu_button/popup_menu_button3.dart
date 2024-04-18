import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuButton3Page extends StatefulWidget {
  const PopupMenuButton3Page({super.key});

  @override
  State<PopupMenuButton3Page> createState() => _PopupMenuButton3PageState();
}

class _PopupMenuButton3PageState extends State<PopupMenuButton3Page> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Popup Menu Button 3 - On Selected',
                  desc: 'This is the example of Popup Menu Button with on selected'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                  ],
                  initialValue: 2,
                  onCanceled: () {
                    Fluttertoast.showToast(msg: 'You have canceled the menu.', toastLength: Toast.LENGTH_SHORT);
                  },
                  onSelected: (value) {
                    Fluttertoast.showToast(msg: 'value : $value', toastLength: Toast.LENGTH_SHORT);
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
            ],
          ),
        )
    );
  }
}
