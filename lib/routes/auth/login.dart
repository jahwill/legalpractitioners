import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:legalpractitioners/routes/auth/components/form.dart';

import 'package:legalpractitioners/themeapp/apptheme.dart';

import 'components/signup_button.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ///the containers below are the position at the bottom left screen
            Positioned(
              right: -40.0,
              top: 60,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: kDeffaultColor, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              right: 45.0,
              top: 90,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: kDeffaultColor, shape: BoxShape.circle),
              ),
            ),

            ///the containers below are the position at the bottom left screen

            Positioned(
              left: -40.0,
              bottom: 15.0,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: kDeffaultColor, shape: BoxShape.circle),
              ),
            ),
            Positioned(
              left: 50.0,
              bottom: 40,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: kDeffaultColor, shape: BoxShape.circle),
              ),
            ),

            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
//                    Align(
//                      alignment: Alignment.topLeft,
//                      child: Container(
//                        height: 50,
//                        width: 100,
//                        margin: EdgeInsets.only(bottom: 60, top: 60),
//                        decoration: BoxDecoration(
////                          color: Colors.red,
//                            ),
//                        child: Center(
//                            child: Text(
//                          'Login',
//                          style: GoogleFonts.aBeeZee(
//                            fontSize: 28,
//                            fontWeight: FontWeight.w900,
//                          ),
//                        )),
//                      ),
//                    ),
                    FormContainer(),
                    SignUpButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
