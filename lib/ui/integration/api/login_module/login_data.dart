import 'package:devkitflutter/model/integration/login_model.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LoginDataPage extends StatefulWidget {
  final LoginModel loginData;

  const LoginDataPage({super.key, required this.loginData});

  @override
  State<LoginDataPage> createState() => _LoginDataPageState();
}

class _LoginDataPageState extends State<LoginDataPage> {
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
      body: Center(
        child: Text('Login Data :\n\nsessionId : ${widget.loginData.sessionId}\nfullName : ${widget.loginData.fullName}\nphoneNumber : ${widget.loginData.phoneNumber}\nemail : ${widget.loginData.email}'),
      ),
    );
  }
}
