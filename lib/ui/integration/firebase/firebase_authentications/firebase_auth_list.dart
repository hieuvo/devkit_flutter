import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/firebase/firebase_authentications/auth_anonymous.dart';
import 'package:devkitflutter/ui/integration/firebase/firebase_authentications/auth_email_password.dart';
import 'package:devkitflutter/ui/integration/firebase/firebase_authentications/auth_google.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FirebaseAuthenticationsListPage extends StatefulWidget {
  const FirebaseAuthenticationsListPage({super.key});

  @override
  State<FirebaseAuthenticationsListPage> createState() =>
      _FirebaseAuthenticationsListPageState();
}

class _FirebaseAuthenticationsListPageState
    extends State<FirebaseAuthenticationsListPage> {
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
            const Text('Firebase Authentication Method List',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Used for authentication with Firebase',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.local_fire_department,
                              size: 50, color: Colors.orange)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Anonymous Method',
                page: const AuthAnonymousPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Email / Password Method',
                page: const AuthEmailPasswordPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Sign In',
                page: const AuthGooglePage()),
          ],
        ));
  }
}
