import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SkewTransformPage extends StatefulWidget {
  const SkewTransformPage({super.key});

  @override
  State<SkewTransformPage> createState() => _SkewTransformPageState();
}

class _SkewTransformPageState extends State<SkewTransformPage> {
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
                  title: 'Skew Transform',
                  desc: 'This is the example of skew transform on container'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Original')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Skew X')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform(
                  transform: Matrix4.skewX(0.4),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Skew Y')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform(
                  transform: Matrix4.skewY(0.4),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Skew X Rotate Z with origin')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform(
                  transform: Matrix4.skewX(0.4)..rotateZ(3.14 / 12.0),
                  origin: const Offset(0, -400),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
