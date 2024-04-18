import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline2Page extends StatefulWidget {
  const Timeline2Page({super.key});

  @override
  State<Timeline2Page> createState() => _Timeline2PageState();
}

class _Timeline2PageState extends State<Timeline2Page> {
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
            _timelineTile(
                date: '11 Sep 2019 08:40',
                orderStatus: 'Order Completed',
                orderDescription: 'Your order is completed',
                position: 'first'),
            _timelineTile(
                date: '11 Sep 2019 08:39',
                orderStatus: 'Order Arrived',
                orderDescription: 'Your order has arrived'),
            _timelineTile(
                date: '9 Sep 2019 14:12',
                orderStatus: 'Order Sent',
                orderDescription: 'Your order is being shipped by courier'),
            _timelineTile(
                date: '9 Sep 2019 14:12',
                orderStatus: 'Ready to Pickup',
                orderDescription:
                    'Your order is ready to be picked up by the courier'),
            _timelineTile(
                date: '9 Sep 2019 12:12',
                orderStatus: 'Order Processed',
                orderDescription: 'Your order is being processed'),
            _timelineTile(
                date: '9 Sep 2019 11:52',
                orderStatus: 'Payment Received',
                orderDescription: 'Payment has been received'),
            _timelineTile(
                date: '9 Sep 2019 11:32',
                orderStatus: 'Waiting for Payment',
                orderDescription: 'We are waiting for your payment'),
            _timelineTile(
                date: '9 Sep 2019 11:32',
                orderStatus: 'Order Placed',
                orderDescription: 'We have received your order',
                position: 'last'),
          ],
        ));
  }

  Widget _timelineTile(
      {required String date,
      required String orderStatus,
      required String orderDescription,
      String position = 'mid'}) {
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 16,
          color: position == 'first' ? _color1 : Colors.grey[400]!),
      beforeLineStyle: LineStyle(
          color: position == 'first' ? _color1 : Colors.grey[400]!,
          thickness: 1.5),
      isLast: position == 'last' ? true : false,
      endChild: Container(
          margin: const EdgeInsets.only(left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderStatus,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: _color2)),
              const SizedBox(
                height: 4,
              ),
              Text(date,
                  style: TextStyle(color: Colors.grey[400], fontSize: 11)),
              const SizedBox(
                height: 8,
              ),
              Text(orderDescription, style: TextStyle(color: _color3)),
              position != 'last'
                  ? const SizedBox(height: 24)
                  : const SizedBox.shrink()
            ],
          )),
    );
  }
}
