import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps1.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps10.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps11.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps12.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps13.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps14.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps15.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps2.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps3.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps4.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps5.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps6.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps7.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps8.dart';
import 'package:devkitflutter/ui/integration/maps/google_maps_flutter/google_maps9.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GoogleMapsListPage extends StatefulWidget {
  const GoogleMapsListPage({super.key});

  @override
  State<GoogleMapsListPage> createState() => _GoogleMapsListPageState();
}

class _GoogleMapsListPageState extends State<GoogleMapsListPage> {
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
            const Text('Google Maps Flutter Package',
                style: TextStyle(
                    fontSize: 18, color: black21, fontWeight: FontWeight.w500)),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Flexible(
                      flex: 5,
                      child: Text(
                          'Used to show maps with google maps flutter. To using google maps for web, you must have a valid API_KEY for Google Maps Platform. Check on this link https://cloud.google.com/maps-platform/pricing/sheet',
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
                title: 'Google Maps 1 (Basic Integration)',
                page: const GoogleMaps1Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 2 (GoogleMaps Properties)',
                page: const GoogleMaps2Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 3 (Single Marker)',
                page: const GoogleMaps3Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 4 (Multi Marker)',
                page: const GoogleMaps4Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 5 (Single Marker - Custom Image)',
                page: const GoogleMaps5Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 6 (Multi Marker - Custom Image)',
                page: const GoogleMaps6Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 7 (Controller)',
                page: const GoogleMaps7Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 8 (Single Marker - Visibility On / Off)',
                page: const GoogleMaps8Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 9 (Multi Marker - Visibility On / Off)',
                page: const GoogleMaps9Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 10 (Sliding Detail Information)',
                page: const GoogleMaps10Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 11 (Draw Polylines)',
                page: const GoogleMaps11Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 12 (Draw Circle)',
                page: const GoogleMaps12Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 13 (Custom Icon with label)',
                page: const GoogleMaps13Page()),
            _globalWidget.screenDetailList(
                context: context,
                title: 'Google Maps 14 (Custom Image with label)',
                page: const GoogleMaps14Page()),
            _globalWidget.screenDetailList(
                context: context,
                title:
                    'Google Maps 15 (Get address from latitude and longitude)',
                page: const GoogleMaps15Page()),
          ],
        ));
  }
}
