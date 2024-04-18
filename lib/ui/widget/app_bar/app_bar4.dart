import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppBar4Page extends StatefulWidget {
  const AppBar4Page({super.key});

  @override
  State<AppBar4Page> createState() => _AppBar4PageState();
}

class _AppBar4PageState extends State<AppBar4Page> {
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'App Bar 4 - Properties',
                    desc: 'This is the example of App Bar with properties'
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: AppBar(
                  title: Image.asset('assets/images/logo_horizontal.png', height: 24),
                  centerTitle: true,
                  iconTheme: const IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  backgroundColor: Colors.white,
                  elevation: 20,
                  shadowColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
