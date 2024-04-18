import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class NotSupportedForIosPage extends StatefulWidget {
  const NotSupportedForIosPage({super.key});

  @override
  State<NotSupportedForIosPage> createState() => _NotSupportedForIosPageState();
}

class _NotSupportedForIosPageState extends State<NotSupportedForIosPage> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Not Supported For iOS',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: const Text(
                    'This package or plugin are not supported for iOS when the latest version of DevKit is released.\n\n'
                    'If you find the package or plugin is now supported for iOS, you can help us by letting us know by email so we can update the package or plugins.\n\n'
                    'Thank you and kind regards',
                    style: TextStyle(
                        fontSize: 15, color: black77, letterSpacing: 0.5)),
              ),
            ],
          ),
        ));
  }
}
