import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legalpractitioners/components/carousel.dart';
import 'package:legalpractitioners/routes/auth/login.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';

import 'homecomponents/card.dart';
import 'homecomponents/menu_container_card.dart';
import 'homecomponents/services_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F3),
//      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white, leadingWidth: 40,
        leading: IconButton(
          onPressed: () {
            showModal(
              context: context,
              configuration: FadeScaleTransitionConfiguration(
                  transitionDuration: Duration(milliseconds: 400),
//                  reverseTransitionDuration: Duration(milliseconds: 400),
                  barrierColor: Colors.black26),
              builder: (BuildContext context) {
                return MenuContainerCard();

                ///the menu container comes here
              },
            );
          },
          icon: Icon(Icons.subject),
        ),

//        leading: PopupMenuButton(
//          child: Icon(Icons.subject),
//          itemBuilder: (context) => [
//            PopupMenuItem(
//              enabled: false,
//              child: Container(
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [SizedBox(), Icon(Icons.close)],
//                ),
//              ),
//            ),
//
//            PopupMenuItem(
//              child: Container(
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [SizedBox(), Icon(Icons.close)],
//                ),
//              ),
//            ),
//          ],
//        ),
//

        title: Text(
          'Legal Practitioner'.toUpperCase(),
          style: TextStyle(color: kDeffaulttextcolor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile_pic.jpeg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(
            width: kDeffaultpadding / 1.1,
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: kDeffaultpadding * 2,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: 'Hi,',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 32),
                                  children: [
                                    TextSpan(
                                      text: ' Jahswill',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 28),
                                    )
                                  ]),
                            ),
                            Text(
                              'Take full advantage of the legal backing  '
                              'we offer. ',
//                            overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height:
                          MediaQuery.of(context).size.height > 670 ? 420 : 250,
                      width: MediaQuery.of(context).size.width * 0.5,
                      constraints: MediaQuery.of(context).size.height < 660
                          ? BoxConstraints(maxWidth: 200)
                          : BoxConstraints(maxWidth: 300),
                      child: CarouselSlider1(),
                    ),
                  ],
                ),
                Divider(
                  height: 1.5,
                ),
                ServicesContainer(),
                ImageListCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//}
