import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Timeline1Page extends StatefulWidget {
  const Timeline1Page({super.key});

  @override
  State<Timeline1Page> createState() => _Timeline1PageState();
}

class _Timeline1PageState extends State<Timeline1Page> {
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
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: const Text(
            'Order Status',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              )),
        ),
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            _createPathTop('11 Sep 2019 08:40', 'Order Completed',
                'Your order is completed'),
            _createPath(
                '11 Sep 2019 08:39', 'Order Arrived', 'Your order has arrived'),
            _createPath('9 Sep 2019 14:12', 'Order Sent',
                'Your order is being shipped by courier'),
            _createPath('9 Sep 2019 14:12', 'Ready to Pickup',
                'Your order is ready to be picked up by the courier'),
            _createPath('9 Sep 2019 12:12', 'Order Processed',
                'Your order is being processed'),
            _createPath('9 Sep 2019 11:52', 'Payment Received',
                'Payment has been received'),
            _createPath('9 Sep 2019 11:32', 'Waiting for Payment',
                'We are waiting for your payment'),
            _createPathDown('9 Sep 2019 11:32', 'Order Placed',
                'We have received your order'),
          ],
        ));
  }

  Widget _createPathTop(
      String date, String orderStatus, String orderDescription) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape
                .circle, // You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: _color1,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 7.5, right: 7.5),
                child: Container(
                  width: 1,
                  color: _color1,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: _color2)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(date,
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 11)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(color: _color3)),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _createPath(String date, String orderStatus, String orderDescription) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape
                .circle, // You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: Colors.grey[400],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 7.5, right: 7.5),
                child: Container(
                  width: 1,
                  color: Colors.grey[400],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: _color2)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(date,
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 11)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(color: _color3)),
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _createPathDown(
      String date, String orderStatus, String orderDescription) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape
                .circle, // You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: Colors.grey[400],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 48, right: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: _color2)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(date,
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 11)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(color: _color3)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
