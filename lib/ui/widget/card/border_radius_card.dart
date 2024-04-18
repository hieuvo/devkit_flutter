import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderRadiusCardPage extends StatefulWidget {
  const BorderRadiusCardPage({super.key});

  @override
  State<BorderRadiusCardPage> createState() => _BorderRadiusCardPageState();
}

class _BorderRadiusCardPageState extends State<BorderRadiusCardPage> {
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
                  title: 'Border Radius Card',
                  desc: 'This is the example of border radius on card'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Card border radius all')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding:const EdgeInsets.all(15),
                    child: const Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border radius with top left and bottom right radius')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Container(
                      padding:const EdgeInsets.all(15),
                      child: const Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border radius with image')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                      child: buildCacheNetworkImage(url: '$globalUrl/product/1.jpg')
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
