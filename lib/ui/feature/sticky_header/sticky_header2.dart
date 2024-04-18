/*
https://pub.dev/packages/sticky_headers
*/
import 'package:devkitflutter/model/feature/product_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeader2Page extends StatefulWidget {
  const StickyHeader2Page({super.key});

  @override
  State<StickyHeader2Page> createState() => _StickyHeader2PageState();
}

class _StickyHeader2PageState extends State<StickyHeader2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          primary: true,
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Sticky Header 2 - Animated Headers with Content',
                    desc: 'This is the example of animated headers with content on Sticky Header'
                ),
                const SizedBox(height: 16),
                Column(
                  children: List.generate(productData.length-1, (index) {
                    return StickyHeaderBuilder(
                      builder: (BuildContext context, double stuckAmount) {
                        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                        return Container(
                          height: 50.0,
                          color: Color.lerp(Colors.blue[700], Colors.pinkAccent, stuckAmount),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  productData[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Offstage(
                                offstage: stuckAmount <= 0.0,
                                child: Opacity(
                                  opacity: stuckAmount,
                                  child: IconButton(
                                    icon: const Icon(Icons.favorite, color: Colors.white),
                                    onPressed: (){
                                      Fluttertoast.showToast(msg: 'Press Love for product ${productData[index].name}', toastLength: Toast.LENGTH_SHORT);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      content: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: buildCacheNetworkImage(url: productData[index].image),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        )
    );
  }
}
