import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/last_seen_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class LastSeenProductPage extends StatefulWidget {
  const LastSeenProductPage({super.key});

  @override
  State<LastSeenProductPage> createState() => _LastSeenProductPageState();
}

class _LastSeenProductPageState extends State<LastSeenProductPage> {
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
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: const Text(
            'Last Seen Product',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView.builder(
          itemCount: lastSeenData.length,
          // Add one more item for progress indicator
          padding: const EdgeInsets.symmetric(vertical: 0),
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index, boxImageSize);
          },
        )
    );
  }

  Widget _buildItem(index, boxImageSize){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: lastSeenData[index].name, image: lastSeenData[index].image, price: lastSeenData[index].price, rating: lastSeenData[index].rating, review: lastSeenData[index].review, sale: lastSeenData[index].sale)));
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4)),
                      child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: lastSeenData[index].image)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lastSeenData[index].name,
                          style: GlobalStyle.productName.copyWith(fontSize: 13),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text('\$ ${_globalFunction.removeDecimalZeroFormat(lastSeenData[index].price)}',
                              style: GlobalStyle.productPrice),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: softGrey, size: 12),
                              Text(' ${lastSeenData[index].location}',
                                  style: GlobalStyle.productLocation)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              _reusableWidget.createRatingBar(rating: lastSeenData[index].rating, size: 12),
                              Text('(${lastSeenData[index].review})', style: GlobalStyle.productTotalReview)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text('${lastSeenData[index].sale} Sale',
                              style: GlobalStyle.productSale),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        (index == lastSeenData.length - 1)
            ? const Wrap()
            : Divider(
          height: 0,
          color: Colors.grey[400],
        )
      ],
    );
  }
}
