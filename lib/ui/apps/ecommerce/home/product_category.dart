import 'package:carousel_slider/carousel_slider.dart';
import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/category_all_product_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/category_banner_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/category_new_product_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/category_trending_product_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class ProductCategoryPage extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const ProductCategoryPage({super.key, this.categoryId = 0, required this.categoryName});
  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  int _currentImageSlider = 0;

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
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            widget.categoryName.replaceAll('\n', ' '),
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          actions: [
            IconButton(
                icon: const Icon(Icons.search, color: blackGrey),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                }),
          ],
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: PopScope(
          canPop: true,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              _createCategorySlider(),
              Container(
                margin: const EdgeInsets.only(top:20, left: 16, right: 16),
                child: const Text('Trending Product', style: GlobalStyle.sectionTitle),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: boxImageSize*GlobalStyle.horizontalProductHeightMultiplication,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryTrendingProductData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildTrendingProductCard(index, boxImageSize);
                    },
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top:20, left: 16, right: 16),
                child: const Text('New Product', style: GlobalStyle.sectionTitle),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: boxImageSize*GlobalStyle.horizontalProductHeightMultiplication,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNewProductData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildNewProductCard(index, boxImageSize);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:20, left: 16, right: 16),
                child: const Text('All Product', style: GlobalStyle.sectionTitle),
              ),
              CustomScrollView(
                  shrinkWrap: true,
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: GlobalStyle.gridDelegateRatio,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return _buildAllProductCard(index);
                          },
                          childCount: categoryAllProductData.length,
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        )
    );
  }

  Widget _createCategorySlider(){
    return Stack(
      children: [
        CarouselSlider(
          items: categoryBannerData.map((item) => Container(
            child: buildCacheNetworkImage(width: 0, height: 0, url: item.image),
          )).toList(),
          options: CarouselOptions(
              aspectRatio: 2,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageSlider = index;
                });
              }
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: categoryBannerData.map((item) {
                int index = categoryBannerData.indexOf(item);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageSlider == index
                        ? softBlue
                        : Colors.grey[300],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingProductCard(index, boxImageSize){
    return SizedBox(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: categoryTrendingProductData[index].name, image: categoryTrendingProductData[index].image, price: categoryTrendingProductData[index].price, rating: categoryTrendingProductData[index].rating, review: categoryTrendingProductData[index].review, sale: 44)));
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: categoryTrendingProductData[index].image)
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryTrendingProductData[index].name,
                      style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:5),
                      child: Text('\$ ${_globalFunction.removeDecimalZeroFormat(categoryTrendingProductData[index].price)}', style: GlobalStyle.productPrice),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _reusableWidget.createRatingBar(rating: categoryTrendingProductData[index].rating, size: 12),
                          Text('(${categoryTrendingProductData[index].review})', style: GlobalStyle.productTotalReview)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewProductCard(index, boxImageSize){
    return SizedBox(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: categoryNewProductData[index].name, image: categoryNewProductData[index].image, price: categoryNewProductData[index].price, rating: categoryNewProductData[index].rating, review: categoryNewProductData[index].review, sale: 36)));
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: categoryNewProductData[index].image)
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryNewProductData[index].name,
                      style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:5),
                      child: Text('\$ ${_globalFunction.removeDecimalZeroFormat(categoryNewProductData[index].price)}', style: GlobalStyle.productPrice),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _reusableWidget.createRatingBar(rating: categoryNewProductData[index].rating, size: 12),
                          Text('(${categoryNewProductData[index].review})', style: GlobalStyle.productTotalReview)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllProductCard(index){
    final double boxImageSize = ((MediaQuery.of(context).size.width)-24)/2-12;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: categoryAllProductData[index].name, image: categoryAllProductData[index].image, price: categoryAllProductData[index].price, rating: categoryAllProductData[index].rating, review: categoryAllProductData[index].review, sale: categoryAllProductData[index].sale)));
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: categoryAllProductData[index].image)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryAllProductData[index].name,
                    style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${_globalFunction.removeDecimalZeroFormat(categoryAllProductData[index].price)}', style: GlobalStyle.productPrice),
                        Text('${categoryAllProductData[index].sale} Sale', style: GlobalStyle.productSale)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: softGrey, size: 12),
                        Text(' ${categoryAllProductData[index].location}', style: GlobalStyle.productLocation)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        _reusableWidget.createRatingBar(rating: categoryAllProductData[index].rating, size: 12),
                        Text('(${categoryAllProductData[index].review})', style: GlobalStyle.productTotalReview)
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
}
