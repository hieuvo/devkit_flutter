import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/firebase/firebase_authentications/firebase_auth_list.dart';
import 'package:devkitflutter/ui/integration/firebase/firebase_storage/firebase_storage.dart';
import 'package:devkitflutter/ui/integration/firebase/firestore/firestore_list.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FirebaseListPage extends StatefulWidget {
  const FirebaseListPage({super.key});

  @override
  State<FirebaseListPage> createState() => _FirebaseListPageState();
}

class _FirebaseListPageState extends State<FirebaseListPage> {
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
            const Text('Firebase',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Choose Firebase Tools.',
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
                title: 'Firebase Authentications',
                page: const FirebaseAuthenticationsListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Firestore',
                page: const FirestoreListPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Firebase Storage',
                page: const FirebaseStoragePage()),
          ],
        ));
  }
}
