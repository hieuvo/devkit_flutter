import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ImageOpacityPage extends StatefulWidget {
  const ImageOpacityPage({super.key});

  @override
  State<ImageOpacityPage> createState() => _ImageOpacityPageState();
}

class _ImageOpacityPageState extends State<ImageOpacityPage> {
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
              _globalWidget.createDetailWidget(
                  title: 'Image Opacity',
                  desc: 'This is the example of opacity on image'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Opacity 1')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 1,
                  child: Image.asset('assets/images/lamp.jpg'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Opacity 0.1')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset('assets/images/lamp.jpg'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Opacity 0.5')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset('assets/images/lamp.jpg'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Opacity 0.9')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.9,
                  child: buildCacheNetworkImage(url: '$globalUrl/product/1.jpg'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
