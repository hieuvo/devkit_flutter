import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderContainerPage extends StatefulWidget {
  const BorderContainerPage({super.key});

  @override
  State<BorderContainerPage> createState() => _BorderContainerPageState();
}

class _BorderContainerPageState extends State<BorderContainerPage> {
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
                  title: 'Border Container',
                  desc: 'This is the example of border on container'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border all')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border all with color')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pinkAccent,
                      width: 4,
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border only 1 side')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Colors.black,
                        )
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border only 2 side')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                      ),
                      top: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Border width')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 4
                        )
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border all width')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Border different color and width')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: Colors.redAccent,
                            width: 10
                        ),
                        top: BorderSide(
                            color: Colors.blue,
                            width: 30
                        ),
                        right: BorderSide(
                            color: Colors.purpleAccent,
                            width: 5
                        ),
                        bottom: BorderSide(
                            color: Colors.orangeAccent,
                            width: 20
                        )
                    ),
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
