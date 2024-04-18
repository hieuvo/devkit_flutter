import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureDetectorWidgetPage extends StatefulWidget {
  const GestureDetectorWidgetPage({super.key});

  @override
  State<GestureDetectorWidgetPage> createState() =>
      _GestureDetectorWidgetPageState();
}

class _GestureDetectorWidgetPageState extends State<GestureDetectorWidgetPage> {
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
                  title: 'Gesture Detector Widget',
                  desc:
                      'Gesture Detector Widget used to handle touch on object.',
                  icon: Icons.touch_app),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('On single tap')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Tapped once', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text('Tap me once')),
                  ),
                ),
              ),
              const Divider(),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                      'On single tap without behaviour, you only can hit the text or icon')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Pressed 1', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menu Title',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Icon(Icons.chevron_right, size: 20, color: softGrey),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                      'On single tap with behaviour, you can hit all entire container')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: 'Pressed 2', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menu Title',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Icon(Icons.chevron_right, size: 20, color: softGrey),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('On double tap')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onDoubleTap: () {
                    Fluttertoast.showToast(
                        msg: 'Tapped double', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text('Tap me twice')),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('On long press')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onLongPress: () {
                    Fluttertoast.showToast(
                        msg: 'Long press', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text('Long press me')),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
