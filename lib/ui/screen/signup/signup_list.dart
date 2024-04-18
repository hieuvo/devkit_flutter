import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/signup/signup1.dart';
import 'package:devkitflutter/ui/screen/signup/signup2.dart';
import 'package:devkitflutter/ui/screen/signup/signup3.dart';
import 'package:devkitflutter/ui/screen/signup/signup4.dart';
import 'package:flutter/material.dart';

class SignupListPage extends StatefulWidget {
  const SignupListPage({super.key});

  @override
  State<SignupListPage> createState() => _SignupListPageState();
}

class _SignupListPageState extends State<SignupListPage> {
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
            const Text('Sign Up Screen',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Sign up screen used for authentication before going to the home page.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.how_to_reg,
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
                title: 'Sign up 1',
                page: const Signup1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign up 2',
                page: const Signup2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign up 3',
                page: const Signup3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Sign up 4',
                page: const Signup4Page()),
          ],
        ));
  }
}
