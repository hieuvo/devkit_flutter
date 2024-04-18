/*
This is account page
we used AutomaticKeepAliveClientMixin to keep the state when moving from 1 navbar to another navbar, so the page is not refresh overtime
 */

import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/about.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/account_information/account_information.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/last_seen_product.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/notification_setting.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_list.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/payment_method/payment_method.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/privacy_policy.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/set_address/set_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/terms_conditions.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/chat_us.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/notification.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TabAccountPage extends StatefulWidget {
  const TabAccountPage({super.key});

  @override
  State<TabAccountPage> createState() => _TabAccountPageState();
}

class _TabAccountPageState extends State<TabAccountPage> with AutomaticKeepAliveClientMixin {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    // if we used AutomaticKeepAliveClientMixin, we must call super.build(context);
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Account',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatUsPage()));
                },
                child: const Icon(Icons.email, color: blackGrey)),
            IconButton(
                icon: _reusableWidget.customNotifIcon(count: 8, notifColor: blackGrey),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                }),
          ],
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _createAccountInformation(),
            _createListMenu('Set Address for Delivery', const SetAddressPage()),
            _reusableWidget.divider1(),
            _createListMenu('Order List', const OrderListPage()),
            _reusableWidget.divider1(),
            _createListMenu('Payment Method', const PaymentMethodPage()),
            _reusableWidget.divider1(),
            _createListMenu('Last Seen Product', const LastSeenProductPage()),
            _reusableWidget.divider1(),
            _createListMenu('Notification Setting', const NotificationSettingPage()),
            _reusableWidget.divider1(),
            _createListMenu('About', const AboutPage()),
            _reusableWidget.divider1(),
            _createListMenu('Terms and Conditions', const TermsConditionsPage()),
            _reusableWidget.divider1(),
            _createListMenu('Privacy Policy', const PrivacyPolicyPage()),
            _reusableWidget.divider1(),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Fluttertoast.showToast(
                      msg: 'Click Sign Out',
                      toastLength: Toast.LENGTH_LONG);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.power_settings_new, size: 20, color: assentColor),
                    SizedBox(width: 8),
                    Text('Sign Out', style: TextStyle(
                        fontSize: 15, color: assentColor
                    )),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _createAccountInformation(){
    final double profilePictureSize = MediaQuery.of(context).size.width/4;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: profilePictureSize,
            height: profilePictureSize,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountInformationPage()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: profilePictureSize,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: profilePictureSize-4,
                  child: Hero(
                    tag: 'profilePicture',
                    child: ClipOval(
                        child: buildCacheNetworkImage(width: profilePictureSize-4, height: profilePictureSize-4, url: '$globalUrl/user/avatar.png')
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Robert Steven', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold
                )),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountInformationPage()));
                  },
                  child: const Row(
                    children: [
                      Text('Account Information', style: TextStyle(
                          fontSize: 14, color: blackGrey
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.chevron_right, size: 20, color: softGrey)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createListMenu(String menuTitle, StatefulWidget page){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menuTitle, style: const TextStyle(
                fontSize: 15, color: charcoal
            )),
            const Icon(Icons.chevron_right, size: 20, color: softGrey),
          ],
        ),
      ),
    );
  }
}
