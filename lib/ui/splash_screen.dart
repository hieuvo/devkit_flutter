/*
This is splash screen page
Don't forget to add all images and sound used in this pages at the pubspec.yaml
 */

import 'dart:async';
import 'package:universal_io/io.dart';

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePage()), (Route<dynamic> route) => false);
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      Platform.isIOS?SystemUiOverlayStyle.light:const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: black21,
        systemNavigationBarIconBrightness: Brightness.light
      ),
    );

    if(_second != 0){
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopScope(
          canPop: false,
          child: Container(
            color: black21,
            child: Center(
              child: Image.asset('assets/images/logo_dark.png', height: 200),
            ),
          ),
        )
    );
  }
}
