import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
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
            'Add Address',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Address Title *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Recipient\'s Name *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Recipient\'s Phone Number',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Address Line 1 *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Address Line 2',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'State / Province / Region *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Postal Code *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
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
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      )
                  ),
                ),
                onPressed: () {
                  _reusableWidget.startLoading(context, 'Add Address Success', 1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ],
        )
    );
  }
}
