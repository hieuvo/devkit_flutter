// Follow this instruction to make it work on Android and iOS https://pub.dev/packages/flutter_barcode_scanner

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/feature/barcode_scanner/barcode_scanner1.dart';
import 'package:devkitflutter/ui/feature/barcode_scanner/barcode_scanner2.dart';
import 'package:devkitflutter/ui/feature/barcode_scanner/barcode_scanner3.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BarcodeScannerListPage extends StatefulWidget {
  const BarcodeScannerListPage({super.key});

  @override
  State<BarcodeScannerListPage> createState() => _BarcodeScannerListPageState();
}

class _BarcodeScannerListPageState extends State<BarcodeScannerListPage> {
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
            const Text('Barcode Scanner', style: TextStyle(
                fontSize: 18, color: black21, fontWeight: FontWeight.w500
            )),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex:5,
                      child: Text('Barcode Scanner is used to scan Normal Barcode or QR Code on application.\n\nBoth Barcode Scanner 1 and Barcode Scanner 2 can scan Normal and QR Code, the different is only Graphic Overlay.', style: TextStyle(
                          fontSize: 15, color: black77,letterSpacing: 0.5
                      ))
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.qr_code, size: 50, color: softBlue))
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
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 1 (Normal Barcode Graphics Overlay)', page: const BarcodeScanner1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 2 (QR Code Graphics Overlay)', page: const BarcodeScanner2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 3 (Continuous Scan)', page: const BarcodeScanner3Page()),
          ],
        )
    );
  }
}
