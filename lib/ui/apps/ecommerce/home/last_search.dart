import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/last_search_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class LastSearchPage extends StatefulWidget {
  const LastSearchPage({super.key});

  @override
  State<LastSearchPage> createState() => _LastSearchPageState();
}

class _LastSearchPageState extends State<LastSearchPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
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
            'Last Search',
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
          child: CustomScrollView(
              shrinkWrap: true,
              primary: false,
              physics: const AlwaysScrollableScrollPhysics(),
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
                        return _buildLastSearchCard(index);
                      },
                      childCount: lastSearchData.length,
                    ),
                  ),
                ),
              ]),
        ));
  }

  Widget _buildLastSearchCard(index) {
    final double boxImageSize = ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                      name: lastSearchData[index].name,
                      image: lastSearchData[index].image,
                      price: lastSearchData[index].price,
                      rating: lastSearchData[index].rating,
                      review: lastSearchData[index].review,
                      sale: lastSearchData[index].sale)));
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: lastSearchData[index].image)),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lastSearchData[index].name,
                    style: GlobalStyle.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${_globalFunction.removeDecimalZeroFormat(lastSearchData[index].price)}', style: GlobalStyle.productPrice),
                        Text('${lastSearchData[index].sale} Sale', style: GlobalStyle.productSale)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: softGrey, size: 12),
                        Text(' ${lastSearchData[index].location}',
                            style: GlobalStyle.productLocation)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        _reusableWidget.createRatingBar(rating: lastSearchData[index].rating, size: 12),
                        Text(
                            '(${lastSearchData[index].review})',
                            style: GlobalStyle.productTotalReview)
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
