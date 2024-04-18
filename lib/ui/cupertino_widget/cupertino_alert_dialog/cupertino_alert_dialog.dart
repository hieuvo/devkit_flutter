import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoAlertDialogPage extends StatefulWidget {
  const CupertinoAlertDialogPage({super.key});

  @override
  State<CupertinoAlertDialogPage> createState() => _CupertinoAlertDialogPageState();
}

class _CupertinoAlertDialogPageState extends State<CupertinoAlertDialogPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Cupertino Alert Dialog',
                desc: 'An iOS-style alert dialog.',
                icon: Icons.event
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Alert Dialog',
                  onPressed: (){
                    showCupertinoDialog<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Alert'),
                        content: const Text('Proceed with destructive action?'),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            child: const Text('No'),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press No', toastLength: Toast.LENGTH_SHORT);
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press Yes', toastLength: Toast.LENGTH_SHORT);
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
