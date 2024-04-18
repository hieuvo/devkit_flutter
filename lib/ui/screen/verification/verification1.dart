import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Verification1Page extends StatefulWidget {
  const Verification1Page({super.key});

  @override
  State<Verification1Page> createState() => _Verification1PageState();
}

class _Verification1PageState extends State<Verification1Page> {
  final Color _color1 = const Color(0xFF07ac12);
  final Color _color2 = const Color(0xFF515151);
  final Color _color3 = const Color(0xff777777);

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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(30, 120, 30, 30),
          children: <Widget>[
            Center(
                child: Text(
                  'Choose Verification Method',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _color2
                  ),
                )
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                'Please choose one of the methods below to get a verification code',
                style: TextStyle(
                    fontSize: 13,
                    color: _color3
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: 'Click verification with email', toastLength: Toast.LENGTH_SHORT);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    children: [
                      Icon(Icons.email, color: _color1, size: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email to', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _color2
                            )),
                            const SizedBox(
                              height: 3,
                            ),
                            Text('example@domain.com', style: TextStyle(
                                fontSize: 13,
                                color: _color3
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: 'Click verification with sms', toastLength: Toast.LENGTH_SHORT);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    children: [
                      Icon(Icons.phone_android, color: _color1, size: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SMS to', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _color2
                            )),
                            const SizedBox(
                              height: 3,
                            ),
                            Text('0811888999', style: TextStyle(
                                fontSize: 13,
                                color: _color3
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: 'Click verification with whatsapp', toastLength: Toast.LENGTH_SHORT);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    children: [
                      const Image(image: AssetImage("assets/images/whatsapp.png"), width: 50, height: 50),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Whatsapp to', style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _color2
                            )),
                            const SizedBox(
                              height: 3,
                            ),
                            Text('0811888999', style: TextStyle(
                                fontSize: 13,
                                color: _color3
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Click back', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: _color1
                    ),
                    Text(
                      ' Back',
                      style: TextStyle(
                          color: _color1,
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
