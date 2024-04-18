import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu1.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu2.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu3.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu4.dart';
import 'package:devkitflutter/ui/feature/category_menu/category_menu5.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CategoryMenuListPage extends StatefulWidget {
  const CategoryMenuListPage({super.key});

  @override
  State<CategoryMenuListPage> createState() => _CategoryMenuListPageState();
}

class _CategoryMenuListPageState extends State<CategoryMenuListPage> {
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
            const Text('Category Menu',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Category menu used to list all category of the apps.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.category,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Category Menu 1 (Standart)',
                page: const CategoryMenu1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Category Menu 2 (Horizontal)',
                page: const CategoryMenu2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Category Menu 3 (Bordering)',
                page: const CategoryMenu3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Category Menu 4 (Image Bordering)',
                page: const CategoryMenu4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Category Menu 5 (Card)',
                page: const CategoryMenu5Page()),
          ],
        ));
  }
}
