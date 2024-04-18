import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfile1Page extends StatefulWidget {
  const UserProfile1Page({super.key});

  @override
  State<UserProfile1Page> createState() => _UserProfile1PageState();
}

class _UserProfile1PageState extends State<UserProfile1Page> {
  final Color _color1 = const Color(0xFFE43F3F);
  final Color _color2 = const Color(0xFF333333);
  final Color _color3 = const Color(0xFF666666);

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
        appBar: AppBar(
          backgroundColor: _color1,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          centerTitle: true,
          title: const Text('User Profile', style: TextStyle(
            fontSize: 18,
          )),
        ),
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Center(
              child: GestureDetector(
                onTap: (){
                  _showAlertDialog(context);
                },
                child: ClipOval(
                  child: buildCacheNetworkImage(url: '$globalUrl/user/avatar.png', width: 200),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              alignment: Alignment.center,
              child: Text('Robert Steven', style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: _color2
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click edit profile', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('edit profile', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: _color1, decoration: TextDecoration.underline, decorationThickness: 2
                )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  const SizedBox(height: 4),
                  Text('Robert Steven', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                  const SizedBox(height: 16),
                  Text('Email', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  const SizedBox(height: 4),
                  Text('example@domain.com', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                  const SizedBox(height: 16),
                  Text('Phone Number', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  const SizedBox(height: 4),
                  Text('0811888999', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                ],
              ),
            )
          ],
        )
    );
  }

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No', style: TextStyle(color: softBlue))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Click edit profile picture', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Yes', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text('Edit Profile Picture ?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
