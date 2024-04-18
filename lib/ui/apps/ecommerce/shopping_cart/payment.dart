import 'dart:async';

import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final bool fromList;

  const PaymentPage({super.key, this.fromList = false});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

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
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Payment',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Summary',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Payment',
                          style: TextStyle(color: charcoal, fontSize: 14)),
                      Text('\$74', style: GlobalStyle.paymentTotalPrice)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Payment Method',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return _createChoosePayment();
                            },
                          );
                        },
                        child: const Text('Change',
                            style:
                                TextStyle(color: primaryColor, fontSize: 14)),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffcccccc),
                              width: 1.0,
                            ),
                          ),
                          child:
                              Image.asset('assets/images/visa.png', height: 10),
                        ),
                        const Text('Visa card ending in 4392',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: charcoal))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(32),
              child: TextButton(
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
                    showLoading(
                        'Your payment is success, we will prepare your order as soon as possible');
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Pay',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
            )
          ],
        ));
  }

  Widget _createChoosePayment() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter mystate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: const Text('Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffcccccc),
                            width: 1.0,
                          ),
                        ),
                        child:
                            Image.asset('assets/images/visa.png', height: 10),
                      ),
                      const Text('Visa card ending in 4392')
                    ],
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffcccccc),
                            width: 1.0,
                          ),
                        ),
                        child: Image.asset('assets/images/mastercard.png',
                            height: 20),
                      ),
                      const Text('MasterCard ending in 5309')
                    ],
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffcccccc),
                            width: 1.0,
                          ),
                        ),
                        child:
                            Image.asset('assets/images/visa.png', height: 10),
                      ),
                      const Text('Visa card ending in 2285')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  void showLoading(String textMessage) {
    _progressDialog(context);
    Timer(const Duration(seconds: 2), () {
      Navigator.pop(context);
      _buildShowDialog(context, textMessage);
    });
  }

  Future _progressDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const PopScope(
            canPop: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Future _buildShowDialog(BuildContext context, String textMessage) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      textMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: blackGrey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => primaryColor,
                          ),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                        ),
                        onPressed: () {
                          //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          if (!widget.fromList) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16),
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
