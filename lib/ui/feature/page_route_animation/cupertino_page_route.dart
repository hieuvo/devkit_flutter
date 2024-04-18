import 'package:devkitflutter/ui/feature/page_route_animation/destination.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageRoutePage extends StatefulWidget {
  const CupertinoPageRoutePage({super.key});

  @override
  State<CupertinoPageRoutePage> createState() => _CupertinoPageRoutePageState();
}

class _CupertinoPageRoutePageState extends State<CupertinoPageRoutePage> {
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
                  title: 'Cupertino Page Route',
                  desc: 'This is the example using cupertino page route'
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Go to destination page',
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const DestinationPage()));
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
