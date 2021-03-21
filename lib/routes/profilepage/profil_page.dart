import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legalpractitioners/routes/profilepage/profilepage_model.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';

import 'components/scrollable_content.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F3),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
//
              ///the containers below are the position at the top right
              ///screen for design
              Positioned(
                right: -45.0,
                top: -10,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      color: kDeffaultColor, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                right: 65.0,
                top: 80.0,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: kDeffaultColor, shape: BoxShape.circle),
                ),
              ),
              Container(
                height: 160,
//                color: kDeffaultColor.withOpacity(0.018),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.keyboard_backspace),
                          color: kDeffaultColor,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                userDetail[0].username,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        fontSize: 25,
                                        color: Colors.deepPurple[900]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                userDetail[0].useremail,
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                userDetail[0].id,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 2,
                      thickness: 0.2,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ProfileContentHolder(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
