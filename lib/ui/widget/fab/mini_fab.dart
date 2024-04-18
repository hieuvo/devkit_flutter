import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MiniFabPage extends StatefulWidget {
  const MiniFabPage({super.key});

  @override
  State<MiniFabPage> createState() => _MiniFabPageState();
}

class _MiniFabPageState extends State<MiniFabPage> {
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
                title: 'Mini FAB', desc: 'This is the example of mini fab'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('Below is the example'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'FAB Pressed', toastLength: Toast.LENGTH_SHORT);
        },
        mini: true,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
