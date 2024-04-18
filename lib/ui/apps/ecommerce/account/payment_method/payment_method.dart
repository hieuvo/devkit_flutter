import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/add_payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/edit_payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
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
            'Payment Method',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Default Payment Preferences', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: charcoal
            )),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffcccccc),
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Method', style: TextStyle(
                      fontSize:14, color: Colors.grey[400]
                  )),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
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
                          child: Image.asset('assets/images/visa.png', height: 10),
                        ),
                        const Text('Visa card ending in 4392', style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold, color: charcoal
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Text('Billing Address', style: TextStyle(
                        fontSize:14, color: Colors.grey[400]
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(
                        fontSize: 14, color: charcoal
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Text('Phone Number', style: TextStyle(
                        fontSize:14, color: Colors.grey[400]
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('0811888999', style: TextStyle(
                        fontSize: 14, color: charcoal
                    )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: const Text('List of Payment Method', style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: charcoal
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffcccccc),
                      width: 1.0,
                    ),
                  ),
                ),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Credit Card', style: TextStyle(fontWeight: FontWeight.bold, color: charcoal))),
                    DataColumn(label: Text('Name on Card', style: TextStyle(fontWeight: FontWeight.bold, color: charcoal))),
                    DataColumn(label: Text('Expires on', style: TextStyle(fontWeight: FontWeight.bold, color: charcoal))),
                    DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: charcoal))),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
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
                                  child: Image.asset('assets/images/visa.png', height: 10),
                                ),
                                const Text('Visa card ending in 4392')
                              ],
                            )
                        ),
                        const DataCell(Text("Robert Steven")),
                        const DataCell(Text("04/2023")),
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  decoration: BoxDecoration(
                                      color: softBlue,
                                      borderRadius: BorderRadius.circular(2)
                                  ),
                                  child: const Row(
                                    children: [
                                      Text('Default', style: TextStyle(
                                          color: Colors.white, fontSize: 11
                                      )),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(Icons.done, color: Colors.white, size: 11)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPaymentMethodPage()));
                                  },
                                  child: const Text('Edit', style: TextStyle(
                                      color: softBlue
                                  )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(0);
                                    },
                                    child: const Text('Delete', style: TextStyle(
                                        color: softBlue
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
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
                                  child: Image.asset('assets/images/mastercard.png', height: 20),
                                ),
                                const Text('MasterCard ending in 5309')
                              ],
                            )
                        ),
                        const DataCell(Text("Robert Steven")),
                        const DataCell(Text("07/2022")),
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      showPopupMakeDefault();
                                    },
                                    child: const Text('Make Default', style: TextStyle(
                                        color: softBlue
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPaymentMethodPage()));
                                  },
                                  child: const Text('Edit', style: TextStyle(
                                      color: softBlue
                                  )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(1);
                                    },
                                    child: const Text('Delete', style: TextStyle(
                                        color: softBlue
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
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
                                  child: Image.asset('assets/images/visa.png', height: 10),
                                ),
                                const Text('Visa card ending in 2285')
                              ],
                            )
                        ),
                        const DataCell(Text("Robert Steven")),
                        const DataCell(Text("11/2021")),
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      showPopupMakeDefault();
                                    },
                                    child: const Text('Make Default', style: TextStyle(
                                        color: softBlue
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPaymentMethodPage()));
                                  },
                                  child: const Text('Edit', style: TextStyle(
                                      color: softBlue
                                  )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(2);
                                    },
                                    child: const Text('Delete', style: TextStyle(
                                        color: softBlue
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymentMethodPage()));
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: softBlue,
                            width: 1.0
                        ),
                      )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Add a card',
                      style: TextStyle(
                          color: softBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            )
          ],
        )
    );
  }

  void showPopupMakeDefault() {
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
          _reusableWidget.startLoading(context, 'Success', 0);
        },
        child: const Text('Yes', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Make Default', style: TextStyle(fontSize: 18),),
      content: const Text('Are you sure to make this card as a default payment ?', style: TextStyle(fontSize: 13, color: blackGrey)),
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

  void _showPopupDeletePayment(int index) {
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
          if(index==0){
            Fluttertoast.showToast(msg: 'Please change default payment method if you want to delete this payment method', toastLength: Toast.LENGTH_LONG);
          } else {
            _reusableWidget.startLoading(context, 'Delete Payment Method Success', 0);
          }
        },
        child: const Text('Yes', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Delete Payment Method', style: TextStyle(fontSize: 18),),
      content: const Text('Are you sure to delete this payment method ?', style: TextStyle(fontSize: 13, color: blackGrey)),
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
