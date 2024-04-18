import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  // create controller to edit text field
  TextEditingController _etAddressTitle = TextEditingController();
  TextEditingController _etRecipientName = TextEditingController();
  TextEditingController _etRecipientPhoneNumber = TextEditingController();
  TextEditingController _etAddressLine1 = TextEditingController();
  TextEditingController _etAddressLine2 = TextEditingController();
  TextEditingController _etPostalCode = TextEditingController();
  TextEditingController _etState = TextEditingController();

  @override
  void initState() {
    _etAddressTitle = TextEditingController(text: 'Home Address');
    _etRecipientName = TextEditingController(text: 'Robert Steven');
    _etRecipientPhoneNumber = TextEditingController(text: '0811888999');
    _etAddressLine1 = TextEditingController(text: '6019 Madison St');
    _etAddressLine2 = TextEditingController(text: 'West New York, NJ');
    _etPostalCode = TextEditingController(text: '07093');
    _etState = TextEditingController(text: 'USA');

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
            'Edit Address',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: _etAddressTitle,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etRecipientName,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etRecipientPhoneNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etAddressLine1,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etAddressLine2,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etState,
              decoration: const InputDecoration(
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
            TextField(
              controller: _etPostalCode,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
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
                  _reusableWidget.startLoading(context, 'Edit Address Success', 1);
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
