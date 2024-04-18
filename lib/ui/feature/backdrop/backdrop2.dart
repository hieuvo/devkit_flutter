/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop2Page extends StatefulWidget {
  const Backdrop2Page({super.key});

  @override
  State<Backdrop2Page> createState() => _Backdrop2PageState();
}

class _Backdrop2PageState extends State<Backdrop2Page> {
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
        backgroundColor: Colors.teal,
        title: const Text("Customize Backdrop"),
        actions: const <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.arrow_menu,
          )
        ],
      ),
      backLayerBackgroundColor: Colors.teal,
      backLayer: const Center(
        child: Text("Back Layer", style: TextStyle(
            color: Colors.white
        )),
      ),
      frontLayer: Container(
        color: Colors.lightBlue,
        child: Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.white,
              textColor: Colors.blue,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ),
      ),
    );
  }
}
