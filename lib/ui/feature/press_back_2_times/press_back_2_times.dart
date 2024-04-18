import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PressBack2TimesPage extends StatefulWidget {
  const PressBack2TimesPage({super.key});

  @override
  State<PressBack2TimesPage> createState() => _PressBack2TimesPageState();
}

class _PressBack2TimesPageState extends State<PressBack2TimesPage> {
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

  // this function is used for exit the application, user must click back button two times
  DateTime? _currentBackPressTime;
  void _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press BACK again to back', toastLength: Toast.LENGTH_SHORT);
    } else {
      //  if you want to exit apps, use SystemNavigator.pop(); instead
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              return;
            }
            _onWillPop();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Press Back 2 Times',
                    desc: 'Press back 2 times to do something'
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text('This is the example of feature press back 2 times to back to the previous page'),
                )
              ],
            ),
          ),
        )
    );
  }
}
