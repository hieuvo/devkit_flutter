/*
This package only work on Android
If you want to used on the whole apps, you can add the function on the main.dart

If you want to used it on iOS, you can see this stack overflow to used it :
https://stackoverflow.com/a/66997677
*/

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class DisableScreenshotPage extends StatefulWidget {
  const DisableScreenshotPage({super.key});

  @override
  State<DisableScreenshotPage> createState() => _DisableScreenshotPageState();
}

class _DisableScreenshotPageState extends State<DisableScreenshotPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  bool _secureMode = false;

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
                  title: 'Disable Screenshot',
                  desc: 'This is the example to disable and enable screenshot'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Text('Secure Mode : ${_secureMode ? 'True' : 'False'}'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    buttonName: 'Toggle Secure Mode',
                    onPressed: () async {
                      if(_secureMode){
                        await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
                      } else {
                        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
                      }

                      setState(() {
                        _secureMode = !_secureMode;
                      });
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
