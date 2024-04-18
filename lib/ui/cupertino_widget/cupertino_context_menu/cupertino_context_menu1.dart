import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoContextMenu1Page extends StatefulWidget {
  const CupertinoContextMenu1Page({super.key});

  @override
  State<CupertinoContextMenu1Page> createState() => _CupertinoContextMenu1PageState();
}

class _CupertinoContextMenu1PageState extends State<CupertinoContextMenu1Page> {
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
                    title: 'Cupertino Context Menu 1 - Standart',
                    desc: 'This is the example of standart Cupertino Context Menu'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Press long at the red box to show context menu'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CupertinoContextMenu(
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        trailingIcon: Icons.share,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Share', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                        child: const Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        trailingIcon: CupertinoIcons.heart,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Love', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                        child: const Text('Love'),
                      ),
                      CupertinoContextMenuAction(
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Delete', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                    child: Container(
                      color: Colors.red,
                    ),
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
