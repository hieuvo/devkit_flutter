import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderRadiusContainerPage extends StatefulWidget {
  const BorderRadiusContainerPage({super.key});

  @override
  State<BorderRadiusContainerPage> createState() => _BorderRadiusContainerPageState();
}

class _BorderRadiusContainerPageState extends State<BorderRadiusContainerPage> {
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
                  title: 'Border Radius Container',
                  desc: 'This is the example of border radius on container'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border with radius')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border radius with top left radius')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border radius with different method')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border radius with different method')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border radius with background color')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.blue
                    ),
                    color: Colors.pinkAccent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border radius with image')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.pinkAccent
                    ),
                    color: Colors.yellow,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
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
