/*
https://pub.dev/packages/flutter_spinkit
*/
import 'dart:math';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimationPage extends StatefulWidget {
  const LoadingAnimationPage({super.key});

  @override
  State<LoadingAnimationPage> createState() => _LoadingAnimationPageState();
}

class _LoadingAnimationPageState extends State<LoadingAnimationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Random _random = Random();
  final List bColor = [Colors.pinkAccent, Colors.orange, Colors.green, Colors.lightBlue, Colors.teal];

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
                _globalWidget.createDetailWidget(
                    title: 'Loading Animation',
                    desc: 'This is the example of Loading Indicator with Animation'
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text('Rotating Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitRotatingCircle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Rotating Plain'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitRotatingPlain(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Chasing Dots'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitChasingDots(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Pumping Heart'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPumpingHeart(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Pulse'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPulse(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Double Bounce'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitDoubleBounce(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Wave from Start'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Wave from Center'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Wave from End'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Piano Wave from Start'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.start),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Piano Wave from Center'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.center),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Piano Wave from End'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.end),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Three Bounce'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitThreeBounce(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Three In Out'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitThreeInOut(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Wandering Cubes'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitWanderingCubes(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Wandering Cubes Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitCircle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Four Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingFour(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Four Rectangle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Cube'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingCube(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Cube Grid'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitCubeGrid(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Folding Cube'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFoldingCube(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Ring'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitRing(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Dual Ring'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitDualRing(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Spinning Lines'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitSpinningLines(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Grid Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingGrid(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Grid Rectangle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Square Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitSquareCircle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Spinning Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitSpinningCircle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Spinning Rectangle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Fading Circle'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitFadingCircle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Hour Glass'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitHourGlass(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Pouring Hour Glass'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPouringHourGlass(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Pouring Hour Glass Refined'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitPouringHourGlassRefined(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Ripple'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitRipple(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Dancing Square'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: const SpinKitDancingSquare(color: Colors.white),
                ),
              ],
            ),
          ),
        )
    );
  }
}
