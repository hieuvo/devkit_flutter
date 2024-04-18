import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/forgot_password/forgot_password1.dart';
import 'package:devkitflutter/ui/screen/forgot_password/forgot_password2.dart';
import 'package:devkitflutter/ui/screen/forgot_password/forgot_password3.dart';
import 'package:devkitflutter/ui/screen/forgot_password/forgot_password4.dart';
import 'package:flutter/material.dart';

class ForgotPasswordListPage extends StatefulWidget {
  const ForgotPasswordListPage({super.key});

  @override
  State<ForgotPasswordListPage> createState() => _ForgotPasswordListPageState();
}

class _ForgotPasswordListPageState extends State<ForgotPasswordListPage> {
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
            const Text('Forgot Password Screen',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Forgot password screen used to reset the password of users',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.vpn_key,
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
                title: 'Forgot Password 1',
                page: const ForgotPassword1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Forgot Password 2',
                page: const ForgotPassword2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Forgot Password 3',
                page: const ForgotPassword3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Forgot Password 4',
                page: const ForgotPassword4Page()),
          ],
        ));
  }
}
