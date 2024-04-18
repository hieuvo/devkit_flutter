import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ClipRRectWidgetPage extends StatefulWidget {
  const ClipRRectWidgetPage({super.key});

  @override
  State<ClipRRectWidgetPage> createState() => _ClipRRectWidgetPageState();
}

class _ClipRRectWidgetPageState extends State<ClipRRectWidgetPage> {
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget2(
                  title: 'ClipRRect Widget',
                  desc: 'A widget that clips its child using a rounded rectangle.',
                  icon: Icons.filter_center_focus
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('ClipRRect on image')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: buildCacheNetworkImage(url: '$globalUrl/product/1.jpg', width: 200),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('ClipRRect on container')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('ClipRRect on container with text')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pinkAccent,
                    child: const Text('a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
