import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/api/api1.dart';
import 'package:devkitflutter/ui/integration/api/api2.dart';
import 'package:devkitflutter/ui/integration/api/crud/api3.dart';
import 'package:devkitflutter/ui/integration/api/login_module/login.dart';
import 'package:devkitflutter/ui/integration/api/product_grid.dart';
import 'package:devkitflutter/ui/integration/api/product_listview.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ApiListPage extends StatefulWidget {
  const ApiListPage({super.key});

  @override
  State<ApiListPage> createState() => _ApiListPageState();
}

class _ApiListPageState extends State<ApiListPage> {
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
            const Text('Get Data from API List',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'API is used to connect data from backend server.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.sync_alt,
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
                title: 'API 1 (GET Method)',
                page: const Api1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'API 2 (POST Method)',
                page: const Api2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'API 3 (CRUD)',
                page: const Api3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Login Module',
                page: const LoginPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product Grid',
                page: const ProductGridPage()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Product ListView',
                page: const ProductListviewPage()),
          ],
        ));
  }
}
