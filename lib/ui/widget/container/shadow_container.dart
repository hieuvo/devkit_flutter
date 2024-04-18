import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ShadowContainerPage extends StatefulWidget {
  const ShadowContainerPage({super.key});

  @override
  State<ShadowContainerPage> createState() => _ShadowContainerPageState();
}

class _ShadowContainerPageState extends State<ShadowContainerPage> {
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
                  title: 'Shadow Container',
                  desc: 'This is the example of shadow on container'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Container with shadow')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(10.0, 10.0),
                      )
                    ],
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Container with shadow and blur')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(10.0, 10.0),
                      )
                    ],
                  ),
                  child: const Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Container with multi shadow')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        offset: Offset(20.0, 20.0),
                        blurRadius: 10
                      ),
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(10.0, 10.0),
                        blurRadius: 10
                      ),
                    ],
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
