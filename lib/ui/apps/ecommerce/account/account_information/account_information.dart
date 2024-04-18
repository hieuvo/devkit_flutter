import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_email.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_name.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/edit_phone_number.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({super.key});

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
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
            'Account Information',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _createProfilePicture(),
                const SizedBox(height: 40),
                const Text(
                  'Name',
                  style: GlobalStyle.accountInformationLabel,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Robert Steven',
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNamePage()));
                      },
                      child: const Text('Edit', style: GlobalStyle.accountInformationEdit),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const Text(
                      'Email',
                      style: GlobalStyle.accountInformationLabel,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _verifiedLabel()
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'robert.steven@ijtechnology.net',
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditEmailPage()));
                      },
                      child: const Text('Edit', style: GlobalStyle.accountInformationEdit),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const Text(
                      'Phone Number',
                      style: GlobalStyle.accountInformationLabel,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    _verifiedLabel()
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        '0811888999',
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPhoneNumberPage()));
                      },
                      child: const Text('Edit', style: GlobalStyle.accountInformationEdit),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _createProfilePicture(){
    final double profilePictureSize = MediaQuery.of(context).size.width/3;
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: profilePictureSize,
        height: profilePictureSize,
        child: GestureDetector(
          onTap: () {
            _showPopupUpdatePicture();
          },
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: (profilePictureSize),
                child: Hero(
                  tag: 'profilePicture',
                  child: ClipOval(
                      child: buildCacheNetworkImage(width: profilePictureSize, height: profilePictureSize, url: '$globalUrl/user/avatar.png')
                  ),
                ),
              ),
              // create edit icon in the picture
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 0, left: MediaQuery.of(context).size.width/4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 1,
                  child: const Icon(Icons.edit, size: 12, color: charcoal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verifiedLabel(){
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: softBlue,
          borderRadius: BorderRadius.circular(2)
      ),
      child: const Row(
        children: [
          Text('verified', style: TextStyle(
              color: Colors.white, fontSize: 11
          )),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
      ),
    );
  }

  void _showPopupUpdatePicture() {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Edit Profile Picture', style: TextStyle(fontSize: 18),),
      content: const Text('Do you want to edit profile picture ?', style: TextStyle(fontSize: 13, color: blackGrey)),
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
