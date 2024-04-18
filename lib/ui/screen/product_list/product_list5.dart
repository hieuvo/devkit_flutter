import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/screen/product_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductList5Page extends StatefulWidget {
  const ProductList5Page({super.key});

  @override
  State<ProductList5Page> createState() => _ProductList5PageState();
}

class _ProductList5PageState extends State<ProductList5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  List<ProductModel> _productData = [];
  final Color _color1 = const Color(0xff777777);

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getData(){
    _productData = [
      ProductModel(
          id: 1,
          name: "Adidas Shirt",
          image: "$globalUrl/product/21.jpg",
          sale: 12700,
      ),
      ProductModel(
          id: 2,
          name: "iPhone SE 2020",
          image: "$globalUrl/product/22.jpg",
          sale: 8300,
      ),
      ProductModel(
          id: 3,
          name: "Macbook Air 2020",
          image: "$globalUrl/product/23.jpg",
          sale: 31400,
      ),
      ProductModel(
          id: 4,
          name: "Gaming Chair",
          image: "$globalUrl/product/24.jpg",
          sale: 11900,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          children: [
            _createTrending(),
          ],
        )
    );
  }

  Widget _createTrending(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Trending', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click trending', toastLength: Toast.LENGTH_SHORT);
                },
                child: const Text('view all', style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                ), textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.all(12),
          primary: false,
          childAspectRatio: 4/1.6,
          shrinkWrap: true,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return _buildTrendingProductCard(index);
          }),
        ),
      ],
    );
  }

  Widget _buildTrendingProductCard(index){
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: 'Click ${_productData[index].name}', toastLength: Toast.LENGTH_SHORT);
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, height: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, url: _productData[index].image)
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_productData[index].name, style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold
                      )),
                      const SizedBox(height: 4),
                      Text('${_productData[index].sale} product', style: TextStyle(
                          fontSize: 9, color: _color1
                      ))
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
