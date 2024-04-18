import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/signin/signin1.dart';
import 'package:devkitflutter/ui/screen/signin/signin2.dart';
import 'package:devkitflutter/ui/screen/signin/signin3.dart';
import 'package:devkitflutter/ui/screen/signin/signin4.dart';
import 'package:flutter/material.dart';

class SigninListPage extends StatefulWidget {
  const SigninListPage({super.key});

  @override
  State<SigninListPage> createState() => _SigninListPageState();
}

class _SigninListPageState extends State<SigninListPage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Sign In Screen',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Sign in screen used for authentication before going to the home page.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.login,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('Screen List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign in 1',
                page: const Signin1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign in 2',
                page: const Signin2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign in 3',
                page: const Signin3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign in 4',
                page: const Signin4Page()),
          ],
        ));
  }
}
