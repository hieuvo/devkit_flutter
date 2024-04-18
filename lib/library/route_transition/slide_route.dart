import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final String slideFrom;

  SlideRoute({required this.page, this.slideFrom = 'left'})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Offset offset = const Offset(-1, 0);
            if(slideFrom=='right'){
              offset = const Offset(1, 0);
            } else if(slideFrom=='top'){
              offset = const Offset(0, -1);
            } else if(slideFrom=='bottom'){
              offset = const Offset(0, 1);
            }
            return SlideTransition(
              position: Tween<Offset>(
                begin: offset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          }
        );
}
