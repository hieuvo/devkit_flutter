import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoButtonPage extends StatefulWidget {
  const CupertinoButtonPage({super.key});

  @override
  State<CupertinoButtonPage> createState() => _CupertinoButtonPageState();
}

class _CupertinoButtonPageState extends State<CupertinoButtonPage> {
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
                  title: 'Cupertino Button',
                  desc: 'An iOS-style button.',
                  icon: Icons.smart_button
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('Standart'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: const Text('Standart Button'),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Standart Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Button with Color'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  color: Colors.teal,
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Color Button', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Text('Color Button'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Border Radius Button'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  color: Colors.pinkAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Border Radius Button', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Text('Border Button'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Padding Button'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  color: Colors.lightBlue,
                  padding: const EdgeInsets.all(10),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Padding Button', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Text('Padding Button'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Opacity When Press the Button'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  color: Colors.amber,
                  pressedOpacity: 0.8,
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Opacity Button', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Text('Opacity Button'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Cuppertino Button with Filled'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton.filled(
                  child: const Text('Filled Button'),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Filled Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
