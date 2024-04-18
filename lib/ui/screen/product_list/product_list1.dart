import 'dart:async';

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/screen/product_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductList1Page extends StatefulWidget {
  const ProductList1Page({super.key});

  @override
  State<ProductList1Page> createState() => _ProductList1PageState();
}

class _ProductList1PageState extends State<ProductList1Page> {
  // initialize global function and global widget
  final _globalFunction = GlobalFunction();
  final _globalWidget = GlobalWidget();
  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  final Color _color1 = const Color(0xFF515151);
  final Color _color2 = const Color(0xff777777);
  List<ProductModel> _productData = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  void _getData() {
    // this timer function is just for demo, so after 2 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });

    _productData = [
      ProductModel(
          id: 21,
          name: "Delta Boots Import 8 Inch",
          price: 18.3,
          image: "$globalUrl/product/25.jpg",
          rating: 5,
          review: 212,
          sale: 735,
          location: "Brooklyn"),
      ProductModel(
          id: 20,
          name: "Fimi X8 SE Black",
          price: 567,
          image: "$globalUrl/product/26.jpg",
          rating: 5,
          review: 63,
          sale: 115,
          location: "Brooklyn"),
      ProductModel(
          id: 19,
          name: "Guess Collection Watch Ceramic Type GC 6004 ",
          price: 52,
          image: "$globalUrl/product/27.jpg",
          rating: 5,
          review: 7,
          sale: 7,
          location: "Brooklyn"),
      ProductModel(
          id: 17,
          name: "NEW Original Apple TV 4K 64GB 5th Generation",
          price: 261,
          image: "$globalUrl/product/29.jpg",
          rating: 5,
          review: 98,
          sale: 263,
          location: "Brooklyn"),
      ProductModel(
          id: 16,
          name: "SAMSUNG GALAXY S20 PLUS RAM 8/128GB",
          price: 751,
          image: "$globalUrl/product/30.jpg",
          rating: 5,
          review: 14,
          sale: 17,
          location: "Brooklyn"),
      ProductModel(
          id: 15,
          name: "Xiaomi Smart LED TV Mi 4",
          price: 224.14,
          image: "$globalUrl/product/31.jpg",
          rating: 5,
          review: 701,
          sale: 1558,
          location: "Brooklyn"),
      ProductModel(
          id: 14,
          name: "Adidas EQT Adv Premium Original",
          price: 28.67,
          image: "$globalUrl/product/32.jpg",
          rating: 5,
          review: 146,
          sale: 398,
          location: "Brooklyn"),
      ProductModel(
          id: 13,
          name:
              "Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3",
          price: 139,
          image: "$globalUrl/product/33.jpg",
          rating: 5,
          review: 275,
          sale: 1055,
          location: "Brooklyn"),
      ProductModel(
          id: 12,
          name: "Spatula Set Stainless Kitchen Tools",
          price: 2.5,
          image: "$globalUrl/product/34.jpg",
          rating: 5,
          review: 302,
          sale: 752,
          location: "Brooklyn"),
      ProductModel(
          id: 11,
          name:
              "DATA CABLE TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M",
          price: 3,
          image: "$globalUrl/product/35.jpg",
          rating: 5,
          review: 636,
          sale: 2087,
          location: "Brooklyn"),
      ProductModel(
          id: 10,
          name:
              "BASEUS QUICK CHARGER HEAD QC3.0/4.0 TYPE-C+USB 30W PD 5A - USB TC",
          price: 10.6,
          image: "$globalUrl/product/36.jpg",
          rating: 5,
          review: 2802,
          sale: 7052,
          location: "Brooklyn"),
      ProductModel(
          id: 9,
          name:
              "Xiaomi Powerbank MI2C 20000mAh Mi Power Bank 20000 mAh PLM06ZM",
          price: 19.9,
          image: "$globalUrl/product/37.jpg",
          rating: 5,
          review: 105,
          sale: 227,
          location: "Brooklyn"),
      ProductModel(
          id: 8,
          name:
              "3D FASHION MASK WITH BREATHING VALVE / MASKER PM 2.5 KARBON / WASHABLE - BLACK NEW MODEL",
          price: 2.33,
          image: "$globalUrl/product/38.jpg",
          rating: 5,
          review: 503,
          sale: 3645,
          location: "Brooklyn"),
      ProductModel(
          id: 7,
          name:
              "Robot RT-US04 Table Phone Holder Stand Aluminium Alloy Universal - Pink",
          price: 5.3,
          image: "$globalUrl/product/39.jpg",
          rating: 5,
          review: 1095,
          sale: 3400,
          location: "Brooklyn"),
      ProductModel(
          id: 6,
          name: "Tactical Pants Blackhawk Helikon ",
          price: 10,
          image: "$globalUrl/product/40.jpg",
          rating: 5,
          review: 63,
          sale: 131,
          location: "Brooklyn"),
      ProductModel(
          id: 5,
          name:
              "Sony SRS- XB12 / XB 12 Extra Bass Portable Bluetooth Speaker - Black",
          price: 48,
          image: "$globalUrl/product/41.jpg",
          rating: 5,
          review: 182,
          sale: 427,
          location: "Brooklyn"),
      ProductModel(
          id: 4,
          name:
              "Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air",
          price: 22.66,
          image: "$globalUrl/product/42.jpg",
          rating: 5,
          review: 131,
          sale: 466,
          location: "Brooklyn"),
      ProductModel(
          id: 3,
          name:
              "Macbook Pro 2019 TouchBar MV912 15\" 16GB 512GB 2.3GHz 8-core i9 Gray",
          price: 2212,
          image: "$globalUrl/product/43.jpg",
          rating: 5,
          review: 16,
          sale: 37,
          location: "Brooklyn"),
      ProductModel(
          id: 2,
          name: "New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575",
          price: 1643,
          image: "$globalUrl/product/44.jpg",
          rating: 5,
          review: 2,
          sale: 3,
          location: "Brooklyn"),
      ProductModel(
          id: 1,
          name: "Adidas Football Predator 19.3 FG F35594 Original",
          price: 9,
          image: "$globalUrl/product/45.jpg",
          rating: 5,
          review: 30,
          sale: 70,
          location: "Brooklyn"),
    ];
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
            'Product List',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              )),
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: _color2),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Click search', toastLength: Toast.LENGTH_SHORT);
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: (_loading == true)
              ? _shimmerLoading.buildShimmerProduct(
                  ((MediaQuery.of(context).size.width) - 24) / 2 - 12)
              : CustomScrollView(slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.625,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return _buildItem(index);
                        },
                        childCount: _productData.length,
                      ),
                    ),
                  ),
                ]),
        ));
  }

  Widget _buildItem(index) {
    final double boxImageSize =
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Fluttertoast.showToast(
              msg: 'Click ${_productData[index].name}',
              toastLength: Toast.LENGTH_SHORT);
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: buildCacheNetworkImage(
                    width: boxImageSize,
                    height: boxImageSize,
                    url: _productData[index].image)),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _productData[index].name,
                    style: TextStyle(fontSize: 12, color: _color1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '\$ ${_globalFunction.removeDecimalZeroFormat(_productData[index].price!)}',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                        Text('${_productData[index].sale} Sale',
                            style:
                                const TextStyle(fontSize: 11, color: softGrey))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: softGrey, size: 12),
                        Text(' ${_productData[index].location!}',
                            style:
                                const TextStyle(fontSize: 11, color: softGrey))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        _globalWidget.createRatingBar(
                            rating: _productData[index].rating!, size: 12),
                        Text('(${_productData[index].review})',
                            style:
                                const TextStyle(fontSize: 11, color: softGrey))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future refreshData() async {
    setState(() {
      _productData.clear();
      _loading = true;
      _getData();
    });
  }
}
