import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class DeliveryEstimatedPage extends StatefulWidget {
  const DeliveryEstimatedPage({super.key});

  @override
  State<DeliveryEstimatedPage> createState() => _DeliveryEstimatedPageState();
}

class _DeliveryEstimatedPageState extends State<DeliveryEstimatedPage> {
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
            'Delivery Estimated',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          children: [
            _createLocationInformation(),
            _createCourierInformation()
          ],
        )
    );
  }

  Widget _createLocationInformation(){
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Location', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold
          )),
          const SizedBox(
            height: 16,
          ),
          const Text('Delivery from :', style: TextStyle(
              color: softGrey, fontSize: 14
          )),
          const SizedBox(
            height: 4,
          ),
          const Text('Brooklyn, NY 11204, USA', style: TextStyle(
              color: charcoal, fontSize: 14
          )),
          const SizedBox(
            height: 12,
          ),
          const Text('Delivery to :', style: TextStyle(
              color: softGrey, fontSize: 14
          )),
          const SizedBox(
            height: 4,
          ),
          const Text('Robert Steven', style: TextStyle(
              color: charcoal, fontSize: 14
          )),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: const Text('0811888999', style: TextStyle(
                color: charcoal, fontSize: 14
            )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: const Text('6019 Madison St', style: TextStyle(
                color: charcoal, fontSize: 14
            )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: const Text('West New York, NJ 07093', style: TextStyle(
                color: charcoal, fontSize: 14
            )),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: const Text('USA', style: TextStyle(
                color: charcoal, fontSize: 14
            )),
          )
        ],
      ),
    );
  }

  Widget _createCourierInformation(){
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Courier', style: GlobalStyle.chooseCourier),
          const SizedBox(
            height: 8,
          ),
          const Text('Courier price based on weight per 1000gr', style: TextStyle(
              color: softGrey, fontSize: 14
          )),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('DHL', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$13', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$22', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('FedEx', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('Other 1', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('Other 2', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('Other 3', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('Other 4', style: GlobalStyle.courierTitle),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
        ],
      ),
    );
  }
}
