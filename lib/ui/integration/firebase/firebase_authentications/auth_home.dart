import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({super.key});

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _firebaseUser;
  String? _firebaseEmail, _firebaseName, _firebasePhoto;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _checkUserLogin();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _checkUserLogin(){
    setState(() {
      _firebaseUser = _auth.currentUser;
      //debugPrint('firebaseUser : $_firebaseUser');
      if(_firebaseUser == null){
        Navigator.pop(context);
      } else {
        _firebaseEmail = (_firebaseUser!.email != '') ? _firebaseUser!.email : null;
        _firebaseName = (_firebaseUser!.displayName != '') ? _firebaseUser!.displayName : null;
        _firebasePhoto = (_firebaseUser!.photoURL != '') ? _firebaseUser!.photoURL : null;
      }
    });
  }

  Future<void> _signOut() async {
    await _auth.signOut();

    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Authentication Home Page'),
              const SizedBox(height: 20),
              _firebasePhoto!=null?ClipOval(child: buildCacheNetworkImage(url: _firebasePhoto, width: 100)):const SizedBox.shrink(),
              _firebasePhoto!=null?const SizedBox(height: 20):const SizedBox.shrink(),
              Text('Firebase UID : ${(_firebaseUser != null)?_firebaseUser!.uid:''}'),
              const SizedBox(height: 20),
              _firebaseEmail!=null?Text('Email : $_firebaseEmail'):const SizedBox.shrink(),
              _firebaseEmail!=null?const SizedBox(height: 20):const SizedBox.shrink(),
              _firebaseName!=null?Text('Name : $_firebaseName'):const SizedBox.shrink(),
              _firebaseName!=null?const SizedBox(height: 20):const SizedBox.shrink(),
              _globalWidget.createButton(
                  buttonName: 'Sign Out',
                  onPressed: (){
                    _signOut();
                  }
              ),
            ],
          ),
        )
    );
  }
}
