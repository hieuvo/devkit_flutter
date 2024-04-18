import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/category_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheet1Page extends StatefulWidget {
  const BottomSheet1Page({super.key});

  @override
  State<BottomSheet1Page> createState() => _BottomSheet1PageState();
}

class _BottomSheet1PageState extends State<BottomSheet1Page> {
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
    _categoryData.add(CategoryModel(id: 17, name: 'Electronic', image: '$globalUrl/category/electronic.png'));
    _categoryData.add(CategoryModel(id: 18, name: 'Food', image: '$globalUrl/category/food.png'));
    _categoryData.add(CategoryModel(id: 19, name: 'Fashion', image: '$globalUrl/category/fashion.png'));
    _categoryData.add(CategoryModel(id: 20, name: 'Sport', image: '$globalUrl/category/sport.png'));
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Bottom Sheet for Category',
                  desc: 'This is the example of bottom sheet for category'
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Open BottomSheet',
                    onPressed: (){
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                        ),
                        builder: (BuildContext context) {
                          return _showPopup();
                        },
                      );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showPopup(){
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
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text('Category Menu', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
            )),
          ),
          Flexible(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              childAspectRatio: 1,
              shrinkWrap: true,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 4,
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
                                  fontSize: 12,
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
      );
    });
  }
}
