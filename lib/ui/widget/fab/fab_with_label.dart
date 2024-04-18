import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FabWithLabelPage extends StatefulWidget {
  const FabWithLabelPage({super.key});

  @override
  State<FabWithLabelPage> createState() => _FabWithLabelPageState();
}

class _FabWithLabelPageState extends State<FabWithLabelPage> {
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
                title: 'FAB with label',
                desc: 'This is the example of fab with label'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const Text('Below is the example'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'FAB Pressed', toastLength: Toast.LENGTH_SHORT);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Data'),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
