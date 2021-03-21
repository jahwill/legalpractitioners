import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';

import 'package:legalpractitioners/exportedfiles.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
//        color: Colors.yellow,
          ),
      constraints: BoxConstraints(maxWidth: 700.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 5,
          ),
          OpenContainer(
            transitionDuration: Duration(milliseconds: 600),
            closedElevation: 0.6,
            openBuilder: (context, closeContainer) => RegisterPage(),
            closedBuilder: (context, openContainer) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDeffaultpadding * 2),
              child: RichText(
                text: TextSpan(
                    text: 'Sign ',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: kDeffaulttextcolor),
                    children: [
                      TextSpan(
                        text: 'Up',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue[900],
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
