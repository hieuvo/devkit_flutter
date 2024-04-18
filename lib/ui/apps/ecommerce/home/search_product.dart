import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/search_product_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search.dart';
import 'package:devkitflutter/ui/apps/ecommerce/reusable_widget.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class SearchProductPage extends StatefulWidget {
  final String words;

  const SearchProductPage({super.key, this.words = ''});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  final TextEditingController _etSearch = TextEditingController();

  // create sort filter data
  late List<String> _sortList;
  int _sortIndex = 0;

  // create other filter 1 data
  late List<String> _otherFilterOneList;
  int _otherFilterOneIndex = 0;

  // create other filter 2 data
  late List<String> _otherFilterTwoList;
  int _otherFilterTwoIndex = 0;

  // create other filter 3 data
  late List<String> _otherFilterThreeList;
  int _otherFilterThreeIndex = 0;

  @override
  void initState() {
    _etSearch.text = widget.words;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initForLang();
    });

    super.initState();
  }

  void _initForLang(){
    setState(() {
      _sortList = [
        'Relevant Product',
        'Review',
        'Newest Product',
        'Highest Price',
        'Lowest Price'
      ];
      _otherFilterOneList = [
        'Filter 1',
        'Filter 2',
        'Filter 3',
        'Filter 4'
      ];
      _otherFilterTwoList = [
        'Filter 1',
        'Filter 2',
        'Filter 3',
        'Filter 4',
        'Filter 5',
        'Filter 6',
        'Filter 7'
      ];
      _otherFilterThreeList = [
        'Filter 1',
        'Filter 2',
        'Filter 3',
        'Filter 4',
        'Filter 5',
        'Filter 6',
        'Filter 7',
        'Filter 8',
        'Filter 9',
        'Filter 10'
      ];
    });
  }

  @override
  void dispose() {
    _etSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          elevation: 0,
          title: Container(
            margin: const EdgeInsets.only(right: 16),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => Colors.grey[100]!,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                },
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Icon(Icons.search, color: Colors.grey[500], size: 18),
                    const SizedBox(width: 8),
                    Text(
                      widget.words,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _showFilterPopup();
                    },
                  );
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.filter_list, color: blackGrey))
            ),
          ],
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
                        return _buildSearchProductCard(index);
                      },
                      childCount: searchProductData.length,
                    ),
                  ),
                ),
              ]),
        )
    );
  }

  Widget _showFilterPopup(){
    // must use StateSetter to update data between main screen and popup.
    // if use default setState, the data will not update
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
            child: const Text('Filter', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const Text('Sort', style: GlobalStyle.filterTitle),
                Wrap(
                  children: List.generate(_sortList.length,(index){
                    return _radioSort(_sortList[index],index, mystate);
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text('Other Filter 1', style: GlobalStyle.filterTitle),
                Wrap(
                  children: List.generate(_otherFilterOneList.length,(index){
                    return _otherFilterOneSort(_otherFilterOneList[index],index, mystate);
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text('Other Filter 2', style: GlobalStyle.filterTitle),
                Wrap(
                  children: List.generate(_otherFilterTwoList.length,(index){
                    return _otherFilterTwoSort(_otherFilterTwoList[index],index, mystate);
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text('Other Filter 3', style: GlobalStyle.filterTitle),
                Wrap(
                  children: List.generate(_otherFilterThreeList.length,(index){
                    return _otherFilterThreeSort(_otherFilterThreeList[index],index, mystate);
                  }),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _radioSort(String txt,int index, mystate){
    return GestureDetector(
      onTap: (){
        mystate(() {
          _sortIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _sortIndex == index ? softBlue : Colors.white,
            border: Border.all(
                width: 1,
                color: _sortIndex == index ? softBlue : Colors.grey[300]!
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
            )
        ),
        child: Text(txt, style: TextStyle(
            color: _sortIndex == index ? Colors.white : charcoal
        )),
      ),
    );
  }

  Widget _otherFilterOneSort(String txt,int index, mystate){
    return GestureDetector(
      onTap: (){
        mystate(() {
          _otherFilterOneIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _otherFilterOneIndex == index ? softBlue : Colors.white,
            border: Border.all(
                width: 1,
                color: _otherFilterOneIndex == index ? softBlue : Colors.grey[300]!
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
            )
        ),
        child: Text(txt, style: TextStyle(
            color: _otherFilterOneIndex == index ? Colors.white : charcoal
        )),
      ),
    );
  }

  Widget _otherFilterTwoSort(String txt,int index, mystate){
    return GestureDetector(
      onTap: (){
        mystate(() {
          _otherFilterTwoIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _otherFilterTwoIndex == index ? softBlue : Colors.white,
            border: Border.all(
                width: 1,
                color: _otherFilterTwoIndex == index ? softBlue : Colors.grey[300]!
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
            )
        ),
        child: Text(txt, style: TextStyle(
            color: _otherFilterTwoIndex == index ? Colors.white : charcoal
        )),
      ),
    );
  }

  Widget _otherFilterThreeSort(String txt,int index, mystate){
    return GestureDetector(
      onTap: (){
        mystate(() {
          _otherFilterThreeIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: const EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _otherFilterThreeIndex == index ? softBlue : Colors.white,
            border: Border.all(
                width: 1,
                color: _otherFilterThreeIndex == index ? softBlue : Colors.grey[300]!
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Text(txt, style: TextStyle(
            color: _otherFilterThreeIndex == index ? Colors.white : charcoal
        )),
      ),
    );
  }

  Widget _buildSearchProductCard(index){
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: searchProductData[index].name, image: searchProductData[index].image, price: searchProductData[index].price, rating: searchProductData[index].rating, review: searchProductData[index].review, sale: searchProductData[index].sale)));
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: searchProductData[index].image)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchProductData[index].name,
                    style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${_globalFunction.removeDecimalZeroFormat(searchProductData[index].price)}', style: GlobalStyle.productPrice),
                        Text('${searchProductData[index].sale} Sale', style: GlobalStyle.productSale)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: softGrey, size: 12),
                        Text(' ${searchProductData[index].location}', style: GlobalStyle.productLocation)
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:5),
                    child: Row(
                      children: [
                        _reusableWidget.createRatingBar(rating: searchProductData[index].rating, size: 12),
                        Text('(${searchProductData[index].review})', style: GlobalStyle.productTotalReview)
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
