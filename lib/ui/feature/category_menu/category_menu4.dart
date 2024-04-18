import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/category_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryMenu4Page extends StatefulWidget {
  const CategoryMenu4Page({super.key});

  @override
  State<CategoryMenu4Page> createState() => _CategoryMenu4PageState();
}

class _CategoryMenu4PageState extends State<CategoryMenu4Page> {
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
    _categoryData.add(CategoryModel(id: 10, name: 'Electronic', image: '$globalUrl/category/electronic.png'));
    _categoryData.add(CategoryModel(id: 11, name: 'Fashion', image: '$globalUrl/category/fashion.png'));
    _categoryData.add(CategoryModel(id: 12, name: 'Sport', image: '$globalUrl/category/sport.png'));
    _categoryData.add(CategoryModel(id: 13, name: 'Voucher\nGame', image: '$globalUrl/category/voucher_game.png'));
    _categoryData.add(CategoryModel(id: 14, name: 'Smartphone & Tablets', image: '$globalUrl/category/smartphone.png'));
    _categoryData.add(CategoryModel(id: 15, name: 'Health & Care', image: '$globalUrl/category/health.png'));
    _categoryData.add(CategoryModel(id: 16, name: 'Otomotif', image: '$globalUrl/category/otomotif.png'));
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
                title: 'Category Menu 4',
                desc: 'This is the example of category menu with image bordering'
            ),
          ),
          SizedBox(
            height: 180,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              primary: false,
              childAspectRatio: 1.04,
              shrinkWrap: true,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(_categoryData.length, (index) {
                return GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Click ${_categoryData[index].name}', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Column(
                        children: [
                          ClipOval(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey[300]!
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)
                                ),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: buildCacheNetworkImage(width: 20, height: 20, url: _categoryData[index].image, plColor: Colors.transparent)
                            )
                          ),
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: Text(
                                _categoryData[index].name,
                                style: TextStyle(
                                  color: _color,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ]));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
