import 'dart:math';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RotateTransformPage extends StatefulWidget {
  const RotateTransformPage({super.key});

  @override
  State<RotateTransformPage> createState() => _RotateTransformPageState();
}

class _RotateTransformPageState extends State<RotateTransformPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final double multiply = pi / 180;

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
                  title: 'Rotate Transform',
                  desc: 'This is the example of rotate transform on container'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('rotate 15 degree at the center')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('rotate 15 degree at the center with change origin')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  origin: const Offset(0, 140),
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 65 degree at the center')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 65 * multiply,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 165 degree at the center')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 165 * multiply,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 270 degree at the center')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 270 * multiply,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 15 degree at the bottom left')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 15 degree at the bottom right')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 15 degree at the top left')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('rotate 15 degree at the top right')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.rotate(
                  angle: 15 * multiply,
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: Colors.pink,
                    child: const Text('i am here', style: TextStyle(
                        color: Colors.white
                    )),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
