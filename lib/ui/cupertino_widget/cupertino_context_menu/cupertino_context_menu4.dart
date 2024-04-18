import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoContextMenu4Page extends StatefulWidget {
  const CupertinoContextMenu4Page({super.key});

  @override
  State<CupertinoContextMenu4Page> createState() => _CupertinoContextMenu4PageState();
}

class _CupertinoContextMenu4PageState extends State<CupertinoContextMenu4Page> {
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
                    title: 'Cupertino Context Menu 4 - Change Preview Size when Long Press',
                    desc: 'This is the example of Cupertino Context Menu with change preview size'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Press long at the image to show context menu'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoContextMenu.builder(
                  builder: (BuildContext context, animation) {
                    final Animation value = Tween(
                      begin: MediaQuery.of(context).size.width/2,
                      end: 70,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Interval(
                          CupertinoContextMenu.animationOpensAt,
                          1.0,
                        ),
                      ),
                    );

                    return Image.asset('assets/images/lamp.jpg', width: value.value.toDouble());
                  },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
