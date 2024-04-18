import 'dart:math';

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/library/flutter_overboard/circular_clipper.dart';
import 'package:devkitflutter/library/flutter_overboard/overboard_animator.dart';
import 'package:devkitflutter/library/flutter_overboard/page_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SwipeDirection { leftToRight, rightToLeft, skipToLast }

class OverBoard extends StatefulWidget {
  final List<PageModel> pages;
  final Offset? center;
  final bool? showBullets;
  final VoidCallback finishCallback;
  final VoidCallback? skipCallback;
  final OverBoardAnimator? animator;
  final String? skipText, nextText, finishText;

  const OverBoard(
      {super.key,
      required this.pages,
      this.center,
      this.showBullets,
      this.skipText,
      this.nextText,
      this.finishText,
      required this.finishCallback,
      this.animator,
      this.skipCallback});

  @override
  State<OverBoard> createState() => _OverBoardState();
}

class _OverBoardState extends State<OverBoard> with TickerProviderStateMixin {
  late OverBoardAnimator _animator;

  final ScrollController _scrollController = ScrollController();
  final _bulletPadding = 5.0, _bulletSize = 10.0;
  double _bulletContainerWidth = 0;

  int _counter = 0, _last = 0;
  int _total = 0;
  double initial = 0, distance = 0;
  Random random = Random();
  SwipeDirection _swipeDirection = SwipeDirection.rightToLeft;

  @override
  void initState() {
    super.initState();

    _animator = OverBoardAnimator(this);
    _total = widget.pages.length;
    _animate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getStack(),
    );
  }

  _getStack() {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        initial = details.globalPosition.dx;
      },
      onPanUpdate: (DragUpdateDetails details) {
        distance = details.globalPosition.dx - initial;
      },
      onPanEnd: (DragEndDetails details) {
        initial = 0.0;
        setState(() {
          _last = _counter;
        });
        if (distance > 1 && _counter > 0) {
          setState(() {
            _counter--;
            _swipeDirection = SwipeDirection.leftToRight;
          });
          _animate();
        } else if (distance < 0 && _counter < _total - 1) {
          setState(() {
            _counter++;
            _swipeDirection = SwipeDirection.rightToLeft;
          });
          _animate();
        }
      },
      child: Stack(
        children: <Widget>[
          _getPage(_last),
          AnimatedBuilder(
            animation: _animator.getAnimator(),
            builder: (context, child) {
              return ClipOval(
                  clipper: CircularClipper(
                      _animator.getAnimator().value, widget.center),
                  child: _getPage(_counter));
            },
            child: Container(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Opacity(
                  opacity: (_counter < _total - 1) ? 1.0 : 0.0,
                  child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => primaryColor,
                        ),
                      ),
                      onPressed: (widget.skipCallback ?? _skip),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text(widget.skipText ?? "SKIP"),
                      )
                  ),
                ),
                Expanded(
                  child: Center(child: LayoutBuilder(
                    builder: (context, constraints) {
                      _bulletContainerWidth = constraints.maxWidth - 40.0;
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        child: ((widget.showBullets ?? true)
                            ? SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0; i < _total; i++)
                                      Padding(
                                        padding: EdgeInsets.all(_bulletPadding),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 150),
                                          height: _bulletSize,
                                          width: (i == _counter)
                                              ? _bulletSize*2
                                              : _bulletSize,
                                          decoration: BoxDecoration(
                                              color: (i == _counter)?primaryColor:Colors.grey[300],
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                        ),
                                      )
                                  ],
                                ),
                              )
                            : Container()),
                      );
                    },
                  )),
                ),
                (_counter < _total - 1
                    ? TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) => primaryColor,
                          ),
                        ),
                        onPressed: _next,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(widget.nextText ?? "NEXT"),
                        )
                    )
                    : TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) => primaryColor,
                          ),
                        ),
                        onPressed: widget.finishCallback,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(widget.finishText ?? "FINISH"),
                        )
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getPage(index) {
    PageModel page = widget.pages[index];
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: page.color,
      child: page.child != null
          ? Center(
              child: page.doAnimateChild!
                  ? AnimatedBoard(
                      animator: _animator,
                      child: page.child,
                    )
                  : page.child,
            )
          : (kIsWeb)
            ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    page.doAnimateImage!
                        ? AnimatedBoard(
                      animator: _animator,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: (page.imageAssetPath != null)
                            ? Image.asset(page.imageAssetPath!,
                            width: 300.0, height: 300.0)
                            : buildCacheNetworkImage(
                            width: 300,
                            height: 300,
                            url: page.imageFromUrl,
                            plColor: Colors.transparent),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: (page.imageAssetPath != null)
                          ? Image.asset(page.imageAssetPath!,
                          width: 300.0, height: 300.0)
                          : buildCacheNetworkImage(
                          width: 300,
                          height: 300,
                          url: page.imageFromUrl,
                          plColor: Colors.transparent),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 30.0, left: 30.0, right: 30.0),
                      child: Text(
                        page.title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 75.0, left: 30.0, right: 30.0),
                      child: Text(
                        page.body!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: softGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                page.doAnimateImage!
                    ? AnimatedBoard(
                  animator: _animator,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: (page.imageAssetPath != null)
                        ? Image.asset(page.imageAssetPath!,
                        width: 300.0, height: 300.0)
                        : buildCacheNetworkImage(
                        width: 300,
                        height: 300,
                        url: page.imageFromUrl,
                        plColor: Colors.transparent),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: (page.imageAssetPath != null)
                      ? Image.asset(page.imageAssetPath!,
                      width: 300.0, height: 300.0)
                      : buildCacheNetworkImage(
                      width: 300,
                      height: 300,
                      url: page.imageFromUrl,
                      plColor: Colors.transparent),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 30.0, left: 30.0, right: 30.0),
                  child: Text(
                    page.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 75.0, left: 30.0, right: 30.0),
                  child: Text(
                    page.body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: softGrey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  _next() {
    setState(() {
      _swipeDirection = SwipeDirection.rightToLeft;
      _last = _counter;
      _counter++;
    });
    _animate();
  }

  _skip() {
    setState(() {
      _swipeDirection = SwipeDirection.skipToLast;
      _last = _counter;
      _counter = _total - 1;
    });
    _animate();
  }

  _animate() {
    _animator.getController().forward(from: 0.0);

    double bulletDimension = (_bulletPadding * 2) + (_bulletSize);
    double scroll = bulletDimension * _counter;
    double maxScroll = bulletDimension * _total - 1;
    if (scroll > _bulletContainerWidth &&
        _swipeDirection == SwipeDirection.rightToLeft) {
      double scrollDistance =
          (((scroll - _bulletContainerWidth) ~/ bulletDimension) + 1) *
              bulletDimension;
      _scrollController.animateTo(scrollDistance,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    } else if (scroll < (maxScroll - _bulletContainerWidth) &&
        _swipeDirection == SwipeDirection.leftToRight) {
      _scrollController.animateTo(scroll,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    } else if (_swipeDirection == SwipeDirection.skipToLast) {
      _scrollController.animateTo(maxScroll,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 100));
    }
  }
}

class AnimatedBoard extends StatelessWidget {
  final Widget? child;
  final OverBoardAnimator? animator;

  const AnimatedBoard({super.key, this.animator, this.child});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, 50.0 * (1.0 - animator!.getAnimator().value), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: child,
      ),
    );
  }
}
