import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
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
        backgroundColor: Colors.pinkAccent,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Destination Page',
                    style: TextStyle(color: Colors.white)),
                _globalWidget.createButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.pinkAccent,
                    buttonName: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ));
  }
}
