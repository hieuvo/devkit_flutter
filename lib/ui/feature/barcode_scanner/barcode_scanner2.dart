import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner2Page extends StatefulWidget {
  const BarcodeScanner2Page({super.key});

  @override
  State<BarcodeScanner2Page> createState() => _BarcodeScanner2PageState();
}

class _BarcodeScanner2PageState extends State<BarcodeScanner2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      //debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'QR Code',
                  desc: 'This is the example of QR Code Graphics Overlay'
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              // this is the start of example
              child: _globalWidget.createButton(
                  buttonName: 'Start QR Code scan',
                  onPressed: (){
                    scanQR();
                  }
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: const Text('Scan result : ', style: TextStyle(fontSize: 16)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(_scanBarcode.toString(), style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
