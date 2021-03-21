import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

class ExitEnterRoute extends PageRouteBuilder {
  final exitPage;
  final enterPage;
  ExitEnterRoute({this.exitPage, this.enterPage})
      : super(
//            opaque: false,
//            reverseTransitionDuration: Duration(milliseconds: 700),
            transitionDuration: Duration(milliseconds: 900),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return enterPage;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return Stack(
                children: [
//                  SlideTransition(
//                    position: new Tween<Offset>(
//                      begin: const Offset(0.0, 0.0),
//                      end: const Offset(-1.0, 0.0),
//                    ).animate(animation),
//                    child: exitPage,
//                  ),
//                  SlideTransition(
//                    position: new Tween<Offset>(
//                      begin: const Offset(1.0, 0.0),
//                      end: Offset.zero,
//                    ).animate(animation),
//                    child: enterPage,
//                  ),
                  SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: exitPage,
                      transitionType: SharedAxisTransitionType.scaled),

                  SharedAxisTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: enterPage,
                      transitionType: SharedAxisTransitionType.horizontal),
                ],
              );
            });
}
