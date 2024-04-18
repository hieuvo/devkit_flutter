import 'package:devkitflutter/ui/apps/ecommerce/home.dart';
import 'package:flutter/material.dart';
import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';

class SignupPage extends StatefulWidget {
  final bool fromList;

  const SignupPage({super.key, this.fromList = false});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _etEmail = TextEditingController();
  final TextEditingController _etName = TextEditingController();
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
    _etName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PopScope(
      canPop: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(30, 120, 30, 30),
        children: <Widget>[
          Center(
              child: Image.asset('assets/images/apps/ecommerce/logo.png',
                  height: 32)),
          const SizedBox(
            height: 80,
          ),
          const Text('Sign Up', style: GlobalStyle.authTitle),
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
              labelStyle: TextStyle(color: blackGrey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _etName,
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
              labelText: 'Name',
              labelStyle: TextStyle(color: blackGrey),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: _obscureText,
            style: const TextStyle(color: charcoal),
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0)),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
              labelText: 'Password',
              labelStyle: const TextStyle(color: blackGrey),
              suffixIcon: IconButton(
                  icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                  onPressed: () {
                    _toggleObscureText();
                  }),
            ),
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
                //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                if (!widget.fromList) {
                  Navigator.pop(context);
                }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
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
          ),
        ],
      ),
    ));
  }
}
