import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FabWithBorderRadiusPage extends StatefulWidget {
  const FabWithBorderRadiusPage({super.key});

  @override
  State<FabWithBorderRadiusPage> createState() =>
      _FabWithBorderRadiusPageState();
}

class _FabWithBorderRadiusPageState extends State<FabWithBorderRadiusPage> {
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
                title: 'FAB with border radius',
                desc: 'This is the example of fab with border radius'),
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
        backgroundColor: Colors.pinkAccent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
