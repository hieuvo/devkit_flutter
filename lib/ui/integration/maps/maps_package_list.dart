import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps_list.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MapsPackageListPage extends StatefulWidget {
  const MapsPackageListPage({super.key});

  @override
  State<MapsPackageListPage> createState() => _MapsPackageListPageState();
}

class _MapsPackageListPageState extends State<MapsPackageListPage> {
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
            const Text('Maps Package',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text('Choose between packages.',
                          style: TextStyle(
                              fontSize: 15,
                              color: black77,
                              letterSpacing: 0.5))),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.map,
                              size: 50, color: softBlue)))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              child: const Text('List',
                  style: TextStyle(
                      fontSize: 18,
                      color: black21,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 18),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps Flutter',
                page: const GoogleMapsListPage()),
          ],
        ));
  }
}
