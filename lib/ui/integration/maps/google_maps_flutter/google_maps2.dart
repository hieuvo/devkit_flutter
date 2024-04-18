import 'dart:async';

import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps2Page extends StatefulWidget {
  const GoogleMaps2Page({super.key});

  @override
  State<GoogleMaps2Page> createState() => _GoogleMaps2PageState();
}

class _GoogleMaps2PageState extends State<GoogleMaps2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final LatLng _initialPosition = const LatLng(-6.168033, 106.900467);

  bool _mapLoading = true;
  Timer? _timerDummy;

  // GoogleMaps Property
  bool _isTraffic = false;
  MapType _mapType = MapType.normal;
  bool _isRotate = true;
  bool _isScroll = true;
  bool _isZoomControl = false;
  bool _isZoomGesture = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(16),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => Colors.blue,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      )
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    elevation: 10,
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.white,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                    ),
                    builder: (BuildContext context) {
                      return _showPopup();
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Change Property',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                _buildGoogleMap(),
                (_mapLoading)?Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey[100],
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ):const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }

  // build google maps to used inside widget
  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: _mapType,
      trafficEnabled: _isTraffic,
      compassEnabled: true,
      rotateGesturesEnabled: _isRotate,
      scrollGesturesEnabled: _isScroll,
      tiltGesturesEnabled: true,
      zoomControlsEnabled: _isZoomControl,
      zoomGesturesEnabled: _isZoomGesture,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _timerDummy = Timer(const Duration(milliseconds: 300), () {
          setState(() {
            _mapLoading = false;
          });
        });
      },
    );
  }

  Widget _showPopup(){
    // must use StateSetter to update data between main screen and popup.
    // if use default setState, the data will not update
    return StatefulBuilder(builder: (BuildContext context, mystate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Text('Google Maps Property', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const Text('Map Type'),
                Row(
                  children: [
                    Radio(
                      value: MapType.normal,
                      groupValue: _mapType,
                      onChanged: (MapType? value) {
                        mystate(() {
                          _mapType = value!;
                        });
                        _updateData(_mapType, value);
                      },
                    ),
                    const Text('Map Type Normal')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: MapType.terrain,
                      groupValue: _mapType,
                      onChanged: (MapType? value) {
                        mystate(() {
                          _mapType = value!;
                        });
                        _updateData(_mapType, value);
                      },
                    ),
                    const Text('Map Type Terrain')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: MapType.satellite,
                      groupValue: _mapType,
                      onChanged: (MapType? value) {
                        mystate(() {
                          _mapType = value!;
                        });
                        _updateData(_mapType, value);
                      },
                    ),
                    const Text('Map Type Satellite')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: MapType.hybrid,
                      groupValue: _mapType,
                      onChanged: (MapType? value) {
                        mystate(() {
                          _mapType = value!;
                        });
                        _updateData(_mapType, value);
                      },
                    ),
                    const Text('Map Type Hybrid')
                  ],
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Traffic', style: TextStyle(
                      fontSize: 14
                  )),
                  subtitle: const Text('Enable / Disable Traffic', style: TextStyle(
                      fontSize: 14
                  )),
                  value: _isTraffic,
                  onChanged: (bool value) {
                    mystate(() {
                      _isTraffic = value;
                    });
                    _updateData(_isTraffic, value);
                  },
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Rotate', style: TextStyle(
                      fontSize: 14
                  )),
                  subtitle: const Text('Enable / Disable Rotation', style: TextStyle(
                      fontSize: 14
                  )),
                  value: _isRotate,
                  onChanged: (bool value) {
                    mystate(() {
                      _isRotate = value;
                    });
                    _updateData(_isRotate, value);
                  },
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Scroll', style: TextStyle(
                      fontSize: 14
                  )),
                  subtitle: const Text('Enable / Disable Scroll', style: TextStyle(
                      fontSize: 14
                  )),
                  value: _isScroll,
                  onChanged: (bool value) {
                    mystate(() {
                      _isScroll = value;
                    });
                    _updateData(_isScroll, value);
                  },
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Zoom Control', style: TextStyle(
                      fontSize: 14
                  )),
                  subtitle: const Text('Enable / Disable Zoom Control', style: TextStyle(
                      fontSize: 14
                  )),
                  value: _isZoomControl,
                  onChanged: (bool value) {
                    mystate(() {
                      _isZoomControl = value;
                    });
                    _updateData(_isZoomControl, value);
                  },
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Zoom Gesture', style: TextStyle(
                      fontSize: 14
                  )),
                  subtitle: const Text('Enable / Disable Zoom Gesture', style: TextStyle(
                      fontSize: 14
                  )),
                  value: _isZoomGesture,
                  onChanged: (bool value) {
                    mystate(() {
                      _isZoomGesture = value;
                    });
                    _updateData(_isZoomGesture, value);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<Null> _updateData(var variable, var newVal) async {
    setState(() {
      variable = newVal;
    });
  }
}
