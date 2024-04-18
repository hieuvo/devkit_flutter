import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/ui/apps/ecommerce/account/order/order_status.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/chat_us.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  // initialize global function
  final _globalFunction = GlobalFunction();

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
    final double boxImageSize = (MediaQuery.of(context).size.width / 6);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: 2,
          title: const Text(
            'Order Detail',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        ),
        body: ListView(
          children: [
            _createOrderStatus(),
            Container(
              margin: const EdgeInsets.only(top: 6),
              child: Column(
                children: [
                  _buildItemCard(boxImageSize, 1),
                  _buildItemCard(boxImageSize, 2),
                  _buildItemCard(boxImageSize, 3),
                ],
              ),
            ),
            _createDeliveryDetail(),
            _createPaymentInformation(),
            Container(
              margin: const EdgeInsets.all(32),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => primaryColor,
                        ),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatUsPage()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Chat Us',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }

  Widget _createOrderStatus() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Status',
              style: TextStyle(color: blackGrey, fontSize: 13)),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order Completed',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderStatusPage()));
                },
                child: const Text('View Status',
                    style: TextStyle(color: primaryColor, fontSize: 13)),
              )
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Date',
                  style: TextStyle(color: blackGrey, fontSize: 13)),
              Text('3 September 2019 11:32 UTC',
                  style: TextStyle(
                      color: blackGrey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold))
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          const Text('INV385714262',
              style: TextStyle(color: blackGrey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildItemCard(boxImageSize, id) {
    // create local data
    String name = 'Delta Boots Import 8 Inch';
    String image = '$globalUrl/product/25.jpg';
    int countItem = 1;
    int weight = 800;
    double price = 18.3;
    double totalPrice = 18.3;
    if (id == 2) {
      name =
          'DATA CABLE TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M';
      image = '$globalUrl/product/35.jpg';
      countItem = 2;
      weight = 100;
      price = 3;
      totalPrice = 6;
    } else if (id == 3) {
      name = 'TEROPONG MINI 30 X 60 BINOCULARS HD NIGHT VERSION 30 X 60';
      image = '$globalUrl/product/2.jpg';
      countItem = 1;
      weight = 400;
      price = 7.2;
      totalPrice = 7.2;
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                            name: name,
                            image: image,
                            price: price,
                            rating: 5,
                            review: 23,
                            sale: 40)));
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: buildCacheNetworkImage(
                            width: boxImageSize,
                            height: boxImageSize,
                            url: image)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: GlobalStyle.productName.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: Text('$countItem item  ($weight gr)',
                                  style: GlobalStyle.shoppingCartOtherProduct
                                      .copyWith(color: Colors.grey[400]))),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: Text(
                                '\$${_globalFunction.removeDecimalZeroFormat(price)}',
                                style: GlobalStyle.productPrice),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey[400],
            ),
            Container(
                margin: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Price', style: TextStyle(fontSize: 12)),
                    Text(
                        '\$${_globalFunction.removeDecimalZeroFormat(totalPrice)}',
                        style: GlobalStyle.productPrice)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _createDeliveryDetail() {
    return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivery Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            Table(
              children: [
                const TableRow(children: [
                  Text('Courier Delivery',
                      style: TextStyle(
                        color: blackGrey,
                        fontSize: 13,
                      )),
                  Text('DHL Express',
                      style: TextStyle(
                          color: charcoal,
                          fontSize: 14,
                          fontWeight: FontWeight.bold))
                ]),
                TableRow(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('AWB Number',
                        style: TextStyle(
                          color: blackGrey,
                          fontSize: 13,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('5614571226',
                        style: TextStyle(
                            color: charcoal,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  )
                ]),
                TableRow(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text('Delivery Address',
                        style: TextStyle(
                          color: blackGrey,
                          fontSize: 13,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Robert Steven',
                            style: TextStyle(
                                color: charcoal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text('0811888999',
                            style: TextStyle(
                                color: charcoal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text('6019 Madison St',
                            style: TextStyle(
                                color: charcoal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text('West New York, NJ 07093',
                            style: TextStyle(
                                color: charcoal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text('USA',
                            style: TextStyle(
                                color: charcoal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ],
        ));
  }

  Widget _createPaymentInformation() {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payment Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Method',
                    style: TextStyle(color: blackGrey, fontSize: 13)),
                Text('Visa card ending in 4392',
                    style: TextStyle(
                        color: charcoal,
                        fontSize: 13,
                        fontWeight: FontWeight.bold))
              ],
            ),
            Divider(
              height: 32,
              color: Colors.grey[400],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price (4 item)',
                    style: TextStyle(color: blackGrey, fontSize: 13)),
                Text('\$31.5', style: GlobalStyle.productPrice)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Delivery (1.3 Kg)',
                    style: TextStyle(color: blackGrey, fontSize: 13)),
                Text('\$19', style: GlobalStyle.productPrice)
              ],
            ),
            Divider(
              height: 32,
              color: Colors.grey[400],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Payment',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('\$50.5', style: GlobalStyle.productPrice)
              ],
            ),
          ],
        ));
  }
}
