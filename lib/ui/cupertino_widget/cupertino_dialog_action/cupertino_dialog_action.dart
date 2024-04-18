import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoDialogActionPage extends StatefulWidget {
  const CupertinoDialogActionPage({super.key});

  @override
  State<CupertinoDialogActionPage> createState() => _CupertinoDialogActionPageState();
}

class _CupertinoDialogActionPageState extends State<CupertinoDialogActionPage> {
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
              _globalWidget.createDetailWidget2(
                  title: 'Cupertino Dialog Action',
                  desc: 'A button typically used in a CupertinoAlertDialog.',
                  icon: Icons.call_to_action
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoDialogAction(
                  child: const Text('Action 1'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Press Action 1', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Press Action 2', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Text('Action 2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
