import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/gridview_dynamic_height/staggered_grid.dart';
import 'package:devkitflutter/ui/feature/gridview_dynamic_height/waterfall_flow.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GridviewDynamicHeightListPage extends StatefulWidget {
  const GridviewDynamicHeightListPage({super.key});

  @override
  State<GridviewDynamicHeightListPage> createState() => _GridviewDynamicHeightListPageState();
}

class _GridviewDynamicHeightListPageState extends State<GridviewDynamicHeightListPage> {
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
            const Text('Grid View - Dynamic Height', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Grid View with a different height size.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.slideshow, size: 50, color: softBlue))
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Staggered Grid', page: const StaggeredGridPage()),
            _globalWidget.screenDetailList(context: context, title: 'Waterfall Flow', page: const WaterfallFlowPage())
          ],
        )
    );
  }
}
