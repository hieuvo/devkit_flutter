import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/address_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/add_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/edit_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetAddressPage extends StatefulWidget {
  const SetAddressPage({super.key});

  @override
  State<SetAddressPage> createState() => _SetAddressPageState();
}

class _SetAddressPageState extends State<SetAddressPage> {
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
            'Set Address',
            style: GlobalStyle.appBarTitle,
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressPage()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )
            ),
          ],
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView.builder(
          itemCount: addressData.length,
          // Add one more item for progress indicator
          padding: const EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            return _buildAddressCard(index);
          },
        )
    );
  }

  Widget _buildAddressCard(int index){
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if default address == true, add default label
              addressData[index].defaultAddress==true?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(addressData[index].title, style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16
                  )),
                  _reusableWidget.createDefaultLabel(context)
                ],
              ):Text(addressData[index].title, style: GlobalStyle.addressTitle),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(addressData[index].recipientName, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(addressData[index].phoneNumber, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(addressData[index].addressLine1, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text('${addressData[index].addressLine2} ${addressData[index].postalCode}', style: GlobalStyle.addressContent),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(addressData[index].state, style: GlobalStyle.addressContent),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      addressData[index].defaultAddress==false?GestureDetector(
                        onTap: (){
                          _showPopupMakeDefault();
                        },
                        child: const Text('Make Default', style: GlobalStyle.addressAction),
                      ):const Wrap(),
                      index!=0?const SizedBox(
                        width: 12,
                      ):const Wrap(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAddressPage()));
                        },
                        child: const Text('Edit', style: GlobalStyle.addressAction),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: (){
                          _showPopupDeleteAddress(index);
                        },
                        child: const Text('Delete', style: GlobalStyle.addressAction),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupDeleteAddress(int index) {
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
            Fluttertoast.showToast(msg: 'Please change default address if you want to delete this address', toastLength: Toast.LENGTH_LONG);
          } else {
            setState(() {
              addressData.removeAt(index);
            });
          }
        },
        child: const Text('Yes', style: TextStyle(color: softBlue))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Delete Address', style: TextStyle(fontSize: 18),),
      content: const Text('Are you sure to delete this address ?', style: TextStyle(fontSize: 13, color: blackGrey)),
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

  void _showPopupMakeDefault() {
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
      content: const Text('Are you sure to make this address as a default address ?', style: TextStyle(fontSize: 13, color: blackGrey)),
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
