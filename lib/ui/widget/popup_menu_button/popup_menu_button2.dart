import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton2Page extends StatefulWidget {
  const PopupMenuButton2Page({super.key});

  @override
  State<PopupMenuButton2Page> createState() => _PopupMenuButton2PageState();
}

class _PopupMenuButton2PageState extends State<PopupMenuButton2Page> {
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
                  title: 'Popup Menu Button 2 - Item Builder',
                  desc: 'This is the example of Popup Menu Button with item builder'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    var list = <PopupMenuEntry<Object>>[];
                    list.add(
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Setting Language"),
                      ),
                    );
                    list.add(
                      const PopupMenuDivider(
                        height: 10,
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 2,
                        checked: true,
                        child: Text(
                          "English",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 3,
                        checked: false,
                        child: Text(
                          "Indonesia",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 4,
                        checked: false,
                        child: Text(
                          "Arabic",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 5,
                        checked: false,
                        child: Text(
                          "Chinese",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 6,
                        checked: false,
                        child: Text(
                          "Hindi",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    list.add(
                      const CheckedPopupMenuItem(
                        value: 7,
                        checked: false,
                        child: Text(
                          "Thai",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    return list;
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.pinkAccent,
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
