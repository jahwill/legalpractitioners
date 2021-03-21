import 'package:flutter/material.dart';

import '../profilepage_model.dart';

class ViewImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          height: _size.height,
          width: _size.width,
          color: Color(0xFF08A0e4),
          child: Image.asset(userDetail[0].profileimage),
        ));
  }
}
