/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop1Page extends StatefulWidget {
  const Backdrop1Page({super.key});

  @override
  State<Backdrop1Page> createState() => _Backdrop1PageState();
}

class _Backdrop1PageState extends State<Backdrop1Page> {
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
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: const Text("Default Backdrop"),
        actions: const <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: const Center(
        child: Text("Back Layer"),
      ),
      frontLayer: Center(
        child: _globalWidget.createButton(
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            buttonName: 'Back',
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}
