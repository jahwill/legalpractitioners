import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F3),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.keyboard_backspace,
          size: 30,
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return;
        },
        child: DraggableScrollableSheet(
          initialChildSize: 0.89,
          maxChildSize: 0.93,
          minChildSize: 0.89,
          builder: (BuildContext context, scrollController) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(0, 0),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF3F3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.grey.withOpacity(0.5),
//                            offset: Offset(0, 1),
//                            blurRadius: 0.5,
//                            spreadRadius: 1,
//                          ),
//                        ]
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
