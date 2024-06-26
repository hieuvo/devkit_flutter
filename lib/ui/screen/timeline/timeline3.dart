import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline3Page extends StatefulWidget {
  const Timeline3Page({super.key});

  @override
  State<Timeline3Page> createState() => _Timeline3PageState();
}

class _Timeline3PageState extends State<Timeline3Page> {
  final Color _color1 = const Color(0xFF07ac12);
  final Color _color2 = const Color(0xFF515151);

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: const Text(
            'Order Status',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              )),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            const Text('Horizontal Style', style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500
            )),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(32),
                children: [
                  _timelineTile(date: '9 Sep 2019 11:32', orderStatus: 'Order Placed', position: 'first'),
                  _timelineTile(date: '9 Sep 2019 11:32', orderStatus: 'Waiting for Payment'),
                  _timelineTile(date: '9 Sep 2019 11:52', orderStatus: 'Payment Received', currentPosition: true),
                  _timelineTile(date: '9 Sep 2019 12:12', orderStatus: 'Order Processed'),
                  _timelineTile(date: '9 Sep 2019 14:12', orderStatus: 'Ready to Pickup'),
                  _timelineTile(date: '9 Sep 2019 14:12', orderStatus: 'Order Sent'),
                  _timelineTile(date: '11 Sep 2019 08:39', orderStatus: 'Order Arrived'),
                  _timelineTile(date: '11 Sep 2019 08:40', orderStatus: 'Order Completed', position: 'last'),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _timelineTile({required String date, required String orderStatus, String position = 'mid', bool currentPosition = false}){
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      indicatorStyle: IndicatorStyle(
          indicatorXY: 0.5,
          height: 16,
          color: currentPosition?_color1:Colors.grey[400]!
      ),
      beforeLineStyle: LineStyle(
          color: Colors.grey[400]!,
          thickness: 1.5
      ),
      isFirst: position=='first'?true:false,
      isLast: position=='last'?true:false,
      alignment: TimelineAlign.center,
      startChild: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(date, style: TextStyle(
                  color: Colors.grey[400], fontSize: 11
              ))
            ],
          )
      ),
      endChild: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(orderStatus, style: TextStyle(
                  fontWeight: FontWeight.bold, color: _color2
              ))
            ],
          )
      ),
    );
  }
}
