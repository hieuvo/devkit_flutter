import 'dart:math';

import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WaterfallFlowPage extends StatefulWidget {
  const WaterfallFlowPage({super.key});

  @override
  State<WaterfallFlowPage> createState() => _WaterfallFlowPageState();
}

class _WaterfallFlowPageState extends State<WaterfallFlowPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Color _color1 = const Color(0xFF515151);
  late List<int> boxHeightList = [];
  int itemCount = 20;

  final rnd = Random();

  @override
  void initState() {
    for(int i=1;i<=itemCount;i++){
      boxHeightList.add(rnd.nextInt(200) + 200);
    }
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
        body: WaterfallFlow.builder(
          primary: false,
          //cacheExtent: 0.0,
          //reverse: true,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            // collectGarbage: (List<int> garbages) {
            //   debugPrint('collect garbage : $garbages');
            // },
            // viewportBuilder: (int firstIndex, int lastIndex) {
            //   debugPrint('viewport : [$firstIndex,$lastIndex]');
            // },
          ),
          itemBuilder: (BuildContext c, int index) {
            return _buildItem(index);
          },
          itemCount: itemCount,
        )
    );
  }

  Widget _buildItem(index) {
    final int boxWidth = (((MediaQuery.of(context).size.width) - 24) / 2 - 12).round();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Fluttertoast.showToast(msg: 'Click Images');
        },
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: buildCacheNetworkImage(width: boxWidth.toDouble(), height: boxHeightList[index].toDouble(), url: 'https://picsum.photos/$boxWidth/${boxHeightList[index]}/')),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title ${index+1}',
                    style: TextStyle(
                        fontSize: 14,
                        color: _color1
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
