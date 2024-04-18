import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSearchTextField2Page extends StatefulWidget {
  const CupertinoSearchTextField2Page({super.key});

  @override
  State<CupertinoSearchTextField2Page> createState() => _CupertinoSearchTextField2PageState();
}

class _CupertinoSearchTextField2PageState extends State<CupertinoSearchTextField2Page> {
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
                    title: 'Cupertino Search Text Field 2 - Properties',
                    desc: 'This is the example of Cupertino Search Text Field properties'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.lightBlueAccent,
                  placeholder: "Search your product here...", // placeholder text
                  style: const TextStyle(color: Colors.white), // search text style
                  placeholderStyle: const TextStyle(color: Colors.pinkAccent), // placeholder text style
                  itemColor: Colors.white, // icon color
                  itemSize: 30, // icon size
                  padding: const EdgeInsets.all(20),
                  prefixIcon: const Icon(Icons.settings), // first icon
                  suffixIcon: const Icon(Icons.motion_photos_on), // last icon
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                  onChanged: (String value) {
                    debugPrint('The text has changed to: $value');
                  },
                  onSubmitted: (String value) {
                    debugPrint('Submitted text: $value');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
