import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class EditPaymentMethodPage extends StatefulWidget {
  const EditPaymentMethodPage({super.key});

  @override
  State<EditPaymentMethodPage> createState() => _EditPaymentMethodPageState();
}

class _EditPaymentMethodPageState extends State<EditPaymentMethodPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  TextEditingController _etCreditCardNumber = TextEditingController();
  TextEditingController _etCreditCardName = TextEditingController();
  TextEditingController _etFullName = TextEditingController();
  TextEditingController _etAddressLine1 = TextEditingController();
  TextEditingController _etAddressLine2 = TextEditingController();
  TextEditingController _etCity = TextEditingController();
  TextEditingController _etState = TextEditingController();
  TextEditingController _etPostalCode = TextEditingController();
  TextEditingController _etPhoneNumber = TextEditingController();

  final List<String> _monthList = [];
  final List<String> _yearList = [];
  String _expiredMonth = "04";
  String _expiredYear = "2023";

  @override
  void initState() {
    _etCreditCardNumber = TextEditingController(text: '4485653755194392');
    _etCreditCardName = TextEditingController(text: 'Robert Steven');
    _etFullName = TextEditingController(text: 'Robert Steven');
    _etAddressLine1 = TextEditingController(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
    _etAddressLine2 = TextEditingController(text: 'Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.');
    _etCity = TextEditingController(text: 'New York City');
    _etState = TextEditingController(text: 'New York');
    _etPostalCode = TextEditingController(text: '10010');
    _etPhoneNumber = TextEditingController(text: '0811888999');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initForLang();
    });

    super.initState();
  }

  void _initForLang(){
    setState(() {
      // select box data for month of credit card
      _monthList.add('Month');
      _monthList.add("01");
      _monthList.add('02');
      _monthList.add('03');
      _monthList.add('04');
      _monthList.add('05');
      _monthList.add('06');
      _monthList.add('07');
      _monthList.add('08');
      _monthList.add('09');
      _monthList.add('10');
      _monthList.add('11');
      _monthList.add('12');

      // select box data for year of credit card
      _yearList.add('Year');
      _yearList.add("2020");
      _yearList.add('2021');
      _yearList.add('2022');
      _yearList.add('2023');
      _yearList.add('2024');
      _yearList.add('2025');
    });
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
            'Edit Payment Method',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Credit Card Information', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18
            )),
            Container(
              margin: const EdgeInsets.only(top: 20),
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
                ],
              ),
            ),
            TextField(
              controller: _etCreditCardNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Credit Card Number *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _etCreditCardName,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Name of Cardholder *',
                  labelStyle:
                  TextStyle(color: blackGrey)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Expired Date *', style: TextStyle(
                color: blackGrey, fontSize: 12
            )),
            Row(
              children: [
                _buildExpiredMonth(),
                const SizedBox(
                  width: 16,
                ),
                _buildExpiredYear(),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text('Billing Information', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18
            )),
            TextField(
              controller: _etFullName,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Full Name *',
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
                  labelText: 'Company Name',
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
              controller: _etCity,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'City *',
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
              height: 20,
            ),
            TextField(
              controller: _etPhoneNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: primaryColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Phone Number *',
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
                  _reusableWidget.startLoading(context, 'Edit Payment Method Success', 1);
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

  //  dropdown menu
  DropdownButton<String> _buildExpiredMonth() {
    return DropdownButton<String>(
      value: _expiredMonth,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: (String? data) {
        setState(() {
          _expiredMonth = data!;
        });
      },
      items: _monthList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(alignment: Alignment.center,child: Text(value),),
        );
      }).toList(),
    );
  }

  DropdownButton<String> _buildExpiredYear() {
    return DropdownButton<String>(
      value: _expiredYear,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: (String? data) {
        setState(() {
          _expiredYear = data!;
        });
      },
      items: _yearList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(alignment: Alignment.center,child: Text(value),),
        );
      }).toList(),
    );
  }
}
