import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _etEmail = TextEditingController();

  @override
  void initState() {
    _etEmail = TextEditingController(text: 'robert.steven@ijtechnology.net');

    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.fromLTRB(30, 120, 30, 30),
      children: <Widget>[
        Center(
            child: Image.asset('assets/images/apps/ecommerce/logo.png',
                height: 32)),
        const SizedBox(
          height: 80,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _etEmail,
          style: const TextStyle(color: charcoal),
          onChanged: (textValue) {
            setState(() {});
          },
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(color: blackGrey)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'We will send the instruction to reset your password through the email',
          style: GlobalStyle.resetPasswordNotes,
        ),
        const SizedBox(
          height: 40,
        ),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) => primaryColor,
              ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              )),
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: 'Click Reset Password', toastLength: Toast.LENGTH_LONG);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
        const SizedBox(
          height: 50,
        ),
        // create sign in link
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalStyle.iconBack,
                Text(
                  ' Back to login',
                  style: GlobalStyle.back,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
