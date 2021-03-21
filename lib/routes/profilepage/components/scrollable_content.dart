import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:legalpractitioners/components/animate_singlepage.dart';
import 'package:legalpractitioners/themeapp/apptheme.dart';
import '../profilepagelist_content_model.dart';
import '../profilepage_model.dart';
import '../components/view_userimage.dart';

class ProfileContentHolder extends StatefulWidget {
  const ProfileContentHolder({
    Key key,
    @required this.size,
    this.str,
  }) : super(key: key);

  final size;
  final String str;

  @override
  _ProfileContentHolderState createState() => _ProfileContentHolderState();
}

class _ProfileContentHolderState extends State<ProfileContentHolder> {
  double scrolldown = 0.6;
  bool top = false;
  bool origin = true;

  ///this class is tha scrollable container scrolling from
  ///the buttom of the profile page that holds all the profile page contents
  ///setup
  ///this top bool [top]=false; tells if the user has scrolled to the top

  @override
  Widget build(BuildContext context) {
    double oldYcordinate = widget.size.height - widget.size.height * 0.5;

    ///the  [oldYcordinate] is the first coordinate that the
    /// container first assumed when loaded to screen

    double newYcordnate = top == true
        ? widget.size.height - widget.size.height * scrolldown
        : widget.size.height - widget.size.height * 0.76;

    ///the  [newYcordinate] is the updated  coordinate that the
    /// container takes when scrolled up or down
    return AnimatedContainer(
      height: widget.size.height * 0.76,
      width: widget.size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      duration: Duration(milliseconds: 900),
      transform: Matrix4.translationValues(
          0, origin == true ? oldYcordinate : newYcordnate, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(0, 0),
                blurRadius: 15,
                spreadRadius: 15)
          ]),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notify) {
          bool newtop =
              notify.metrics.extentBefore == notify.metrics.minScrollExtent
                  ? true
                  : false;

          if (newtop != top) {
            setState(() {
              top = newtop;
              origin = false;
            });
          }

          return;
        },
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
//
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: profilelist.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) => Column(
                      children: [
                        ListTile(
                          onTap: profilelist[index].ontap,
                          leading: Container(
                            height: 42.0,
                            width: 42.0,
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kDeffaultColor.withOpacity(0.09),
                            ),
                            child: Image.asset(
                              profilelist[index].iconaddress,
                              color: kDeffaultColor,
                            ),
                          ),
                          title: Text(profilelist[index].title,
                              style: Theme.of(context).textTheme.headline6),
                          subtitle: Text(
                            profilelist[index].subtitle,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        Divider(
                          height: 1,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
              ],
            ),
            Positioned(
              top: -45,
              left: 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      AnimateSinglePage(
                          reverseduration: Duration(milliseconds: 1000),
                          transitiontype: SharedAxisTransitionType.scaled,
                          gotoPage: ViewImage()));
                },
                child: AnimatedContainer(
                  height: 100,
                  width: 100,
                  duration: Duration(milliseconds: 1000),
                  transform: Matrix4.translationValues(0, 0, 0)
                    ..scale(top == true ? 1.0 : 0.85),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment(0, -1.0),
                      fit: BoxFit.cover,
                      image: AssetImage(userDetail[0].profileimage),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 0.1,
                          spreadRadius: 3)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
