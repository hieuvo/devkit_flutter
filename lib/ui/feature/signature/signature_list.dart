import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/signature/signature1.dart';
import 'package:devkitflutter/ui/feature/signature/signature2.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SignatureListPage extends StatefulWidget {
  const SignatureListPage({super.key});

  @override
  State<SignatureListPage> createState() => _SignatureListPageState();
}

class _SignatureListPageState extends State<SignatureListPage> {
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            const Text('Signature', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Digital Signature using different plugin.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.edit, size: 50, color: softBlue))
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List', style: TextStyle(
                  fontSize: 18, color: black21, fontWeight: FontWeight.w500
              )),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Signature 1', page: const Signature1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Signature 2', page: const Signature2Page()),
          ],
        )
    );
  }
}
