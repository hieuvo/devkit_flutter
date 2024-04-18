import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_status.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/flashsale.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            'Notification',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: PopScope(
          canPop: true,
          child: ListView(children: <Widget>[
            _createItem(notifDate: '11 Sep 2019 08:40', notifTitle: 'Order Completed', notifMessage: 'Your order is completed', page: const OrderStatusPage()),
            _createItem(notifDate: '11 Sep 2019 08:39', notifTitle: 'Order Arrived', notifMessage: 'Your order has arrived', page: const OrderStatusPage()),
            _createItem(notifDate: '10 Sep 2019 10:00', notifTitle: 'Flash Sale', notifMessage: 'Hi Robert Steven, Flash Sale is open in 10 minutes. Grab your favorite product on sale', page: const FlashSalePage()),
            _createItem(notifDate: '9 Sep 2019 14:12', notifTitle: 'Order Sent', notifMessage: 'Your order is being shipped by courier', page: const OrderStatusPage()),
            _createItem(notifDate: '9 Sep 2019 14:12', notifTitle: 'Ready to Pickup', notifMessage: 'Your order is ready to be picked up by the courier', page: const OrderStatusPage()),
            _createItem(notifDate: '9 Sep 2019 13:00', notifTitle: 'Trending Product', notifMessage: 'Hi Robert Steven, there is a trending product for you, check it out now'),
            _createItem(notifDate: '9 Sep 2019 12:12', notifTitle: 'Order Processed', notifMessage: 'Your order is being processed', page: const OrderStatusPage()),
            _createItem(notifDate: '9 Sep 2019 11:52', notifTitle: 'Payment Received', notifMessage: 'Payment has been received', page: const OrderStatusPage()),
            _createItem(notifDate: '9 Sep 2019 11:32', notifTitle: 'Waiting for Payment', notifMessage: 'We are waiting for your payment', page: const OrderStatusPage()),
            _createItem(notifDate: '9 Sep 2019 11:32', notifTitle: 'Order Placed', notifMessage: 'We have received your order', page: const OrderStatusPage()),
          ]),
        ));
  }

  Widget _createItem({required String notifDate, required String notifTitle, required String notifMessage, StatefulWidget? page}){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(page!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: charcoal)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(notifDate,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 11)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(notifMessage, style: const TextStyle(color: blackGrey)),
                  ],
                )),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
