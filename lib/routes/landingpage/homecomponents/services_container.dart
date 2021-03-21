import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legalpractitioners/exportedfiles.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: kDeffaultpadding / 1.5),

//      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'We Offer you',
                  style: Theme.of(context).textTheme.headline5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, AnimateSinglePage(gotoPage: ServicePage()));
                  },
                  child: Container(
                      height: 30,
                      width: 60,
                      child: Icon(
                        Icons.more_horiz,
                        size: 32,
                        color: Colors.blue[800],
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: kDeffaultpadding,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                serviceHolder(
                    ontap: () {
                      print('client');

                      ///todo:route to client service page
                    },
                    subtitle: 'Client',
//              color: Colors.lightBlue,

                    icon: 'assets/icons/client.png'),
                serviceHolder(
                    ontap: () {
                      print('consent');

                      ///todo:route to document consent page
                    },
                    subtitle: 'Consent',
//              color: Colors.pink,
                    icon: 'assets/icons/consent.png'),
                serviceHolder(
                  ontap: () {
                    print('documents');

                    ///todo:route to document service page
                  },
                  subtitle: 'Documents',
//            color: Colors.indigo,
                  icon: 'assets/icons/document.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container serviceHolder(
      {@required String subtitle, String icon, Color color, Function ontap}) {
    return Container(
      height: 85.0,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
//              color: color ?? Colors.pink,
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey.withOpacity(0.7),
//                    offset: Offset(0, 1),
//                    blurRadius: 5,
//                    spreadRadius: 2,
//                  ),
//                ]
                ),
                child: Image.asset(
                  icon,
                  color: kDeffaultColor.withAlpha(500),
                ),
              ),
              Text(subtitle,
                  style: GoogleFonts.quicksand(
                      fontSize: 10, fontWeight: FontWeight.w800))
            ],
          ),
        ),
      ),
    );
  }
}
