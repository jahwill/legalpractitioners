import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legalpractitioners/domain/auth/login_and_routepage.dart';
import 'package:legalpractitioners/domain/auth/validate_field.dart';
import 'package:legalpractitioners/exportedfiles.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

///this is the form for the login
class _FormContainerState extends State<FormContainer> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LogInandRoutePage logn = LogInandRoutePage();
  // bool _isloading = false;
  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ValidateField>(context);

    var size = MediaQuery.of(context).size;
    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        height: 450,
        width: size.width,
        padding: EdgeInsets.symmetric(
          vertical: kDeffaultpadding * 1.0,
        ),
        constraints: BoxConstraints(maxWidth: 700.0),
        decoration: BoxDecoration(
            // color: Colors.grey[500].withOpacity(0.9),
            ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
//                          color: Colors.red,
                    ),
                child: Center(
                    child: Text(
                  'Login',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                )),
              ),
            ),
            Container(
                // height: 155.0,
                width: size.width * 0.9,
                padding: EdgeInsets.symmetric(
                  horizontal: kDeffaultpadding / 1.5,
                ),
                constraints: BoxConstraints(maxWidth: 500, minHeight: 160),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.99),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<ValidateField>(
                      builder: (context, validatEmail, child) => TextFormField(
                        ///validation code is at the top and comes first
                        onChanged: (value) {
                          validatEmail.setEmail(value);
                        },
                        keyboardType: TextInputType.emailAddress,

                        /// decoration follows below
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 5, top: 10),
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 20,
                            ),
                            labelText: 'Email',
                            errorText: validatEmail.email.error,
                            errorStyle: TextStyle(
                              fontSize: 10,
                            )),
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                        enableSuggestions: false,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    ///the password field below
                    Consumer<ValidateField>(
                      builder: (context, validatePassword, child) =>
                          TextFormField(
                        onChanged: (password) {
                          validatePassword.setPasswor(password);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 5, top: 10),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 20,
                            ),
                            labelText: 'Password',
                            errorText: validatePassword.password.error,
                            errorStyle: TextStyle(
                              fontSize: 10,
                            )),
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: kDeffaultpadding * 2.5,
            ),
            Container(
              width: size.width * 0.9,
              constraints: BoxConstraints(maxWidth: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                        fontSize: 15),
                  ),
                  Consumer2<ValidateField, LogInandRoutePage>(
                    builder: (context, submiteButton, buttonIcon, child) =>
                        AnimatedContainer(
                      height: 50.0,
                      width: 185.0,
                      duration: Duration(milliseconds: 400),
                      decoration: BoxDecoration(
                          color: !submiteButton.isvalid
                              ? Colors.grey[400]
                              : kDeffaultColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: (!submiteButton.isvalid)
                            ? null
                            : () async {
                                var email = submiteButton.email.value;
                                var password = submiteButton.password.value;
                                var msg =
                                    await buttonIcon.printback(email, password);
                                print(msg);
                                if (msg == 'is a user') {
                                  navigateHome();
                                  buttonIcon.setisLoading(loading: false);
                                } else {
                                  print('wrong login or password');
                                  // submiteButton.setEmail('wrong email');
                                  submiteButton.setPasswor('wrong password');
                                }
                              },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            )),
                            buttonIcon.isLoading == true
                                ? SpinKitCircle(
                                    size: 25,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 28,
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigateHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }
}
