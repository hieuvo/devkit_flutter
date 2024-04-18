import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField7Page extends StatefulWidget {
  const CupertinoTextField7Page({super.key});

  @override
  State<CupertinoTextField7Page> createState() => _CupertinoTextField7PageState();
}

class _CupertinoTextField7PageState extends State<CupertinoTextField7Page> {
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
                    title: 'Cupertino Text Field 7 - Keyboard Type',
                    desc: 'This is the example of Cupertino Text Field with keyboard type'
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Name',
                  keyboardType: TextInputType.name,
                  padding: EdgeInsets.all(16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  padding: EdgeInsets.all(16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Phone',
                  keyboardType: TextInputType.phone,
                  padding: EdgeInsets.all(16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Number',
                  keyboardType: TextInputType.number,
                  padding: EdgeInsets.all(16),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const CupertinoTextField(
                  placeholder: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
