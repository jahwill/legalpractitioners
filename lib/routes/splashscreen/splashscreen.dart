import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legalpractitioners/routes/auth/login.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.17),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Legal Practitioner',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontSize: 28),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LogIn(),
                  ),
                );
              },
              child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(13)),
                  child: progress),
            )
          ],
        ),
      ),
    );
  }

  ///this is the progress
  final progress = SpinKitCubeGrid(
    color: Colors.white,
    size: 25,
  );
}
