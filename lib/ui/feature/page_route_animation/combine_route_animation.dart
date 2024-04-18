import 'package:devkitflutter/library/route_transition/combine_route.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/destination.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CombineRouteAnimationPage extends StatefulWidget {
  const CombineRouteAnimationPage({super.key});

  @override
  State<CombineRouteAnimationPage> createState() => _CombineRouteAnimationPageState();
}

class _CombineRouteAnimationPageState extends State<CombineRouteAnimationPage> {
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
                  title: 'Combine Page Route Animation',
                  desc: 'This is the example to create custom page transition (combine scale and rotate transition).'
              ),
              // to used this animation, create the class first, you can check at lib/library/route_transition/slide_route.dart
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Go to destination page',
                    onPressed: (){
                      Navigator.push(context, CombineRoute(page: const DestinationPage()));
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
