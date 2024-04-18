import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton6Page extends StatefulWidget {
  const PopupMenuButton6Page({super.key});

  @override
  State<PopupMenuButton6Page> createState() => _PopupMenuButton6PageState();
}

class _PopupMenuButton6PageState extends State<PopupMenuButton6Page> {
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
                  title: 'Popup Menu Button 6 - Offset',
                  desc: 'This is the example of Popup Menu Button with offset'
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
                  offset: const Offset(100, 100),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: const ShapeDecoration(
                      color: Colors.pinkAccent,
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.pink, width: 2),
                      ),
                    ),
                    child: const Icon(Icons.airplanemode_active, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
