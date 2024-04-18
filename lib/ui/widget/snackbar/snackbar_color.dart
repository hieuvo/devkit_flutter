import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SnackbarColorPage extends StatefulWidget {
  const SnackbarColorPage({super.key});

  @override
  State<SnackbarColorPage> createState() => _SnackbarColorPageState();
}

class _SnackbarColorPageState extends State<SnackbarColorPage> {
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
                  title: 'Snackbar color',
                  desc: 'This is the example of snackbar with color'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show snackbar with color',
                      onPressed: (){
                        const snackBar = SnackBar(
                            backgroundColor: Colors.pinkAccent,
                            content: Text('Snackbar with color')
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
