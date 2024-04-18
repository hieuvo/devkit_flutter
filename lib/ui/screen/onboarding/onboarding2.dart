import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/library/sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:devkitflutter/library/sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Onboarding2Page extends StatefulWidget {
  const Onboarding2Page({super.key});

  @override
  State<Onboarding2Page> createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  final pages = [
    SkOnboardingModel(
        title: 'Tutorial 1',
        description: 'This is description of tutorial 1. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imageAssetPath: 'assets/images/lamp.jpg'),
    SkOnboardingModel(
        title: 'Tutorial 2',
        description: 'This is description of tutorial 2. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imageFromUrl: '$globalUrl/onboarding/cart.png'),
    SkOnboardingModel(
        title: 'Tutorial 3',
        description: 'This is description of tutorial 3. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imageFromUrl: '$globalUrl/onboarding/delivery.png'),
  ];

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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
          ),
          child: SKOnboardingScreen(
            bgColor: Colors.white,
            themeColor: const Color(0xFFf74269),
            pages: pages,
            skipClicked: (value) {
              Fluttertoast.showToast(msg: 'Click skip', toastLength: Toast.LENGTH_SHORT);
            },
            getStartedClicked: (value) {
              Fluttertoast.showToast(msg: 'Click get started', toastLength: Toast.LENGTH_SHORT);
            },
          ),
        )
    );
  }
}
