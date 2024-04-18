import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SnackbarWithShapePage extends StatefulWidget {
  const SnackbarWithShapePage({super.key});

  @override
  State<SnackbarWithShapePage> createState() => _SnackbarWithShapePageState();
}

class _SnackbarWithShapePageState extends State<SnackbarWithShapePage> {
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
                  title: 'Snackbar with shape',
                  desc: 'This is the example of snackbar with shape.'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show floating snackbar with shape',
                      onPressed: (){
                        final snackBar = SnackBar(
                            elevation: 5,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            content: const Text('Snackbar with shape')
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
