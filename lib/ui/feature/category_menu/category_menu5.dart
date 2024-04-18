import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/category_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryMenu5Page extends StatefulWidget {
  const CategoryMenu5Page({super.key});

  @override
  State<CategoryMenu5Page> createState() => _CategoryMenu5PageState();
}

class _CategoryMenu5PageState extends State<CategoryMenu5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _color = const Color(0xFF515151);

  final List<CategoryModel> _categoryData = [];

  @override
  void initState() {
    _categoryData.add(CategoryModel(id: 1, name: 'Fashion', image: '$globalUrl/category/fashion.png'));
    _categoryData.add(CategoryModel(id: 2, name: 'Smartphone & Tablets', image: '$globalUrl/category/smartphone.png'));
    _categoryData.add(CategoryModel(id: 3, name: 'Electronic', image: '$globalUrl/category/electronic.png'));
    _categoryData.add(CategoryModel(id: 4, name: 'Otomotif', image: '$globalUrl/category/otomotif.png'));
    _categoryData.add(CategoryModel(id: 5, name: 'Sport', image: '$globalUrl/category/sport.png'));
    _categoryData.add(CategoryModel(id: 6, name: 'Food', image: '$globalUrl/category/food.png'));
    _categoryData.add(CategoryModel(id: 7, name: 'Voucher\nGame', image: '$globalUrl/category/voucher_game.png'));
    _categoryData.add(CategoryModel(id: 8, name: 'Health & Care', image: '$globalUrl/category/health.png'));
    _categoryData.add(CategoryModel(id: 9, name: 'Food', image: '$globalUrl/category/food.png'));
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
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Category Menu 5',
                desc: 'This is the example of category menu 5'
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            primary: false,
            childAspectRatio: 1,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: List.generate(_categoryData.length, (index) {
              return GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: 'Click ${_categoryData[index].name}', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCacheNetworkImage(width: 40, height: 40, url: _categoryData[index].image, plColor: Colors.transparent),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Text(
                                _categoryData[index].name,
                                style: TextStyle(
                                  color: _color,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ]),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
