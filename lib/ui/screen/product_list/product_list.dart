import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list1.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list2.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list3.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list4.dart';
import 'package:devkitflutter/ui/screen/product_list/product_list5.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Product List Screen',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Product list used to listing product data.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.list_alt,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('Product List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product List 1 (Grid View)',
                page: const ProductList1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product List 2 (List View)',
                page: const ProductList2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product List 3 (Favorite)',
                page: const ProductList3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product List 4 (Horizontal)',
                page: const ProductList4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product List 5 (Grid Trending Product)',
                page: const ProductList5Page()),
          ],
        ));
  }
}
