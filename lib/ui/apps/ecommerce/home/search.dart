import 'package:devkitflutter/config/apps/ecommerce/constant.dart';
import 'package:devkitflutter/config/apps/ecommerce/global_style.dart';
import 'package:devkitflutter/model/apps/ecommerce/last_seen_model.dart';
import 'package:devkitflutter/model/apps/ecommerce/search_model.dart';
import 'package:devkitflutter/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:devkitflutter/ui/apps/ecommerce/home/search_product.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _etSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etSearch.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 7);
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(
              color: GlobalStyle.appBarIconThemeColor,
            ),
            elevation: GlobalStyle.appBarElevation,
            backgroundColor: GlobalStyle.appBarBackgroundColor,
            systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
            // create search text field in the app bar
            title: Container(
              margin: const EdgeInsets.only(right: 16),
              height: kToolbarHeight - 20,
              child: TextField(
                controller: _etSearch,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (textValue) {
                  setState(() {});
                },
                maxLines: 1,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                decoration: InputDecoration(
                  prefixIcon:
                  Icon(Icons.search, color: Colors.grey[500], size: 18),
                  suffixIcon: (_etSearch.text == '')
                      ? null
                      : GestureDetector(
                      onTap: () {
                        setState(() {
                          _etSearch = TextEditingController(text: '');
                        });
                      },
                      child: Icon(Icons.close,
                          color: Colors.grey[500], size: 18)),
                  contentPadding: const EdgeInsets.all(0),
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Search product',
                ),
              ),
            )),
        body: PopScope(
          canPop: true,
          // if search field is empty, show history search
          // if search field not empty, show search text
          child: _etSearch.text == ''
              ? _showHistorySearch(boxImageSize)
              : _showSearchText(),
        ));
  }

  Widget _showHistorySearch(boxImageSize){
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Last Seen Product', style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold
        )),
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: boxImageSize,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 12),
            scrollDirection: Axis.horizontal,
            itemCount: lastSeenData.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildLastSeenCard(index, boxImageSize);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32),
          child: const Text('Last Search', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: searchData.length,
              // Add one more item for progress indicator
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemBuilder: (BuildContext context, int index) {
                return _buildLastSearchList(index);
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _showSearchText(){
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                int idx = searchData.indexWhere((data) => data.words==_etSearch.text);
                if(idx==-1){
                  if(searchData.length==5){
                    searchData.removeLast();
                  }
                  searchData.insert(0, SearchModel(id: 1, words: _etSearch.text));
                } else {
                  searchData.removeAt(idx);
                  searchData.insert(0, SearchModel(id: 1, words: _etSearch.text));
                }
              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchProductPage(words: _etSearch.text)));
            },
            child: Row(
              children: [
                const Icon(Icons.access_time, color: softGrey, size: 16),
                const SizedBox(width: 12),
                Text(_etSearch.text, style: const TextStyle(color: charcoal)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastSeenCard(index, boxImageSize){
    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: lastSeenData[index].name, image: lastSeenData[index].image, price: lastSeenData[index].price, rating: lastSeenData[index].rating, review: lastSeenData[index].review, sale: lastSeenData[index].sale)));
        },
        child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: lastSeenData[index].image)),
      ),
    );
  }

  Widget _buildLastSearchList(index){
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchProductPage(words: searchData[index].words)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: softGrey, size: 16),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(searchData[index].words,
                        style: const TextStyle(color: charcoal), overflow: TextOverflow.ellipsis, maxLines: 1),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    searchData.removeAt(index);
                  });
                },
                child: const Icon(Icons.close, color: blackGrey, size: 18)
            ),
          ],
        ),
      ),
    );
  }
}
