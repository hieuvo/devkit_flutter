import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Alert Dialog',
                  desc: 'This is the example of alert dialog'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Alert Dialog 1')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open AlertDialog 1',
                    onPressed: (){
                      _showPopup1();
                    }
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Alert Dialog 2')
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  // this is the start of example
                  child: _globalWidget.createButton(
                      buttonName: 'Open AlertDialog 2',
                      onPressed: (){
                        _showPopup2();
                      }
                  ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Alert Dialog 3')
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  // this is the start of example
                  child: _globalWidget.createButton(
                      buttonName: 'Open AlertDialog 3',
                      onPressed: (){
                        _showPopup3();
                      }
                  ),
              ),
            ],
          ),
        )
    );
  }

  void _showPopup1() {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press No', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('No', style: TextStyle(color: softBlue))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Yes', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Yes', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Title', style: TextStyle(fontSize: 18),),
      content: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: black21)),
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

  void _showPopup2() {
    // set up the buttons
    Widget signinFacebook = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Facebook', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Signin with Facebook', style: TextStyle(color: softBlue))
    );
    Widget signinTwitter = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Twitter', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Signin with Twitter', style: TextStyle(color: softBlue))
    );
    Widget signinGoogle = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Google', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Signin with Google', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Title', style: TextStyle(fontSize: 18),),
      content: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: black21)),
      actions: [
        signinFacebook,
        signinTwitter,
        signinGoogle,
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

  void _showPopup3() {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Cancel', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Cancel', style: TextStyle(color: softBlue))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Submit', toastLength: Toast.LENGTH_SHORT);
        },
        child: const Text('Submit', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Title', style: TextStyle(fontSize: 18),),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: black21)),
          TextField(
            autofocus: true,
            style: TextStyle(color: black21),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: primaryColor, width: 2.0)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
        ],
      ),
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
