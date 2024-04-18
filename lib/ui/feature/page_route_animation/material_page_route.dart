import 'package:devkitflutter/ui/feature/page_route_animation/destination.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MaterialPageRoutePage extends StatefulWidget {
  const MaterialPageRoutePage({super.key});

  @override
  State<MaterialPageRoutePage> createState() => _MaterialPageRoutePageState();
}

class _MaterialPageRoutePageState extends State<MaterialPageRoutePage> {
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
                  title: 'Material Page Route',
                  desc: 'This is the example using material page route'
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('To change the animation of MaterialPageRoute, you can see the example in the main.dart')
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Go to destination page',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DestinationPage()));
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
