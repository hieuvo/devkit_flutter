import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/shopping_cart_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/apps/ecommerce/shopping_cart/change_address.dart';
import 'package:devkitflutter/ui/apps/ecommerce/shopping_cart/payment.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  final List<ShoppingCartModel> shoppingCartData;

  const DeliveryPage({super.key, required this.shoppingCartData});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  double _subTotal = 0;
  String _delivery = '';
  double _deliveryPrice = 0;

  @override
  void initState() {
    shoppingCartData = widget.shoppingCartData;
    countSubTotal();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void countSubTotal(){
    _subTotal = 0;
    for(int i=0;i<shoppingCartData.length;i++){
      _subTotal += shoppingCartData[i].price * shoppingCartData[i].qty;
    }
    _subTotal += _deliveryPrice;
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 6);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Delivery',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          children: [
            _createDeliveryInformation(),
            _createOrderListInformation(boxImageSize),
            _createChooseDeliveryInformation(),
            _createSubTotalInformation()
          ],
        )
    );
  }

  Widget _createDeliveryInformation(){
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Flexible(
                child: Text('Home Address', style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                )),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: BoxDecoration(
                    color: softBlue,
                    borderRadius: BorderRadius.circular(2)
                ),
                child: const Row(
                  children: [
                    Text('Default', style: TextStyle(
                        color: Colors.white, fontSize: 13
                    )),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(Icons.done, color: Colors.white, size: 11)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
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
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeAddressPage()));
            },
            child: Container(
              alignment: Alignment.topRight,
              child: const Text('Change Address', style: TextStyle(
                  color: primaryColor, fontSize: 14
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createOrderListInformation(boxImageSize){
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order List', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold
          )),
          Column(
            children: List.generate(shoppingCartData.length,(index){
              int quantity = shoppingCartData[index].qty;
              return GestureDetector(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: shoppingCartData[index].name, image: shoppingCartData[index].image, price: shoppingCartData[index].price, rating: 4, review: 23, sale: 36)));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8)),
                          child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: shoppingCartData[index].image)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shoppingCartData[index].name, style: GlobalStyle.productName.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: Text('$quantity item (150 gr)', style: GlobalStyle.shoppingCartOtherProduct.copyWith(color: Colors.grey[400]))
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: Text('\$${_globalFunction.removeDecimalZeroFormat(quantity*shoppingCartData[index].price)}', style: GlobalStyle.productPrice),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _createChooseDeliveryInformation(){
    return Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivery', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _showDeliveryPopup();
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1,
                        color: Colors.grey[300]!
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10) //         <--- border radius here
                    )
                ),
                child: _delivery == ''?const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_shipping, color: softBlue),
                        SizedBox(width: 12),
                        Text('Choose Delivery', style: TextStyle(
                            color: charcoal, fontWeight: FontWeight.bold
                        )),
                      ],
                    ),
                    Icon(Icons.chevron_right, size: 20, color: softGrey),
                  ],
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_delivery, style: const TextStyle(
                            color: charcoal, fontWeight: FontWeight.bold
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('\$$_deliveryPrice', style: GlobalStyle.deliveryTotalPrice),
                      ],
                    ),
                    const Icon(Icons.chevron_right, size: 20, color: softGrey),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _showDeliveryPopup(){
    return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: const Text('Choose Courier', style: GlobalStyle.chooseCourier),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const Text('DHL', style: GlobalStyle.courierTitle),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'DHL Regular';
                      _deliveryPrice = 13;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$13', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'DHL Express';
                      _deliveryPrice = 22;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$22', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                const Text('FedEx', style: GlobalStyle.courierTitle),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'FedEx Regular';
                      _deliveryPrice = 9;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$9', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'FedEx Express';
                      _deliveryPrice = 17;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$17', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                const Text('Other 1', style: GlobalStyle.courierTitle),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 1 Regular';
                      _deliveryPrice = 9;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$9', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 1 Express';
                      _deliveryPrice = 17;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$17', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                const Text('Other 2', style: GlobalStyle.courierTitle),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 2 Regular';
                      _deliveryPrice = 9;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$9', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 2 Express';
                      _deliveryPrice = 17;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$17', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                const Text('Other 3', style: GlobalStyle.courierTitle),
                GestureDetector(behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 3 Regular';
                      _deliveryPrice = 9;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },

                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$9', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 3 Express';
                      _deliveryPrice = 17;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$17', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 32,
                  color: Colors.grey[400],
                ),
                const Text('Other 4', style: GlobalStyle.courierTitle),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 4 Regular';
                      _deliveryPrice = 9;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Regular', style: GlobalStyle.courierType),
                        Text('\$9', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _delivery = 'Other 4 Express';
                      _deliveryPrice = 17;
                    });
                    countSubTotal();
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Express', style: GlobalStyle.courierType),
                        Text('\$17', style: GlobalStyle.deliveryPrice),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _createSubTotalInformation(){
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sub Total ', style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 5),
              Text('\$${_globalFunction.removeDecimalZeroFormat(_subTotal)}', style: GlobalStyle.shoppingCartTotalPrice),
            ],
          ),
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => primaryColor,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Pay',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
          )
        ],
      ),
    );
  }
}
