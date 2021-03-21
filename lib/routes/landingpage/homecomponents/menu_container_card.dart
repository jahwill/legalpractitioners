import 'package:flutter/material.dart';
import 'package:legalpractitioners/exportedfiles.dart';

class MenuContainerCard extends StatelessWidget {
  const MenuContainerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 240,
          padding: const EdgeInsets.symmetric(
              vertical: kDeffaultpadding / 2, horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                      icon: Image.asset(
                        'assets/icons/purse.png',
                        color: Colors.blue[800],
                      ),
                      subtitle: 'Purse',
                    ),
                    MenuItem(
                      icon: Image.asset(
                        'assets/icons/forum.png',
                        color: Color(0xF53EA5BC),
                      ),
                      subtitle: 'Forum',
                    ),
                    MenuItem(
                      icon: Image.asset('assets/icons/shoping_cart.png',
                          color: Color(0xFFE90091)),
                      subtitle: 'Market',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItem(
                      icon: Image.asset(
                        'assets/icons/forum.png',
                        color: Color(0xFF6E0008),
                      ),
                      subtitle: 'Setting',
                    ),
                    MenuItem(
                      tap: () {
                        Navigator.pop(context);

                        Navigator.push(context,
                            AnimateSinglePage(gotoPage: ServicePage()));
                      },
                      icon: Image.asset(
                        'assets/icons/service_box.png',
                        color: Color(0xFFFAC329),
                      ),
                      subtitle: 'Services',
                    ),
                    MenuItem(
                      tap: () {
                        Navigator.pop(context);

                        Navigator.push(context,
                            AnimateSinglePage(gotoPage: ProfilePage()));
                      },
                      icon: Image.asset(
                        'assets/icons/person.png',
                        color: Color(0xFFA22C2C),
                      ),
                      subtitle: 'Profile',
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F4FA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'close',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  ///this class create the Menu Items holder that is put in the
  ///MenuContainerCard class
  const MenuItem({
    Key key,
    this.subtitle,
    this.icon,
    this.tap,
    this.color,
  })  : assert(icon != null, subtitle != null),
        super(key: key);
  final String subtitle;
  final dynamic icon;
  final Function tap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 47.0,
            width: 47.0,
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(6.5),
            decoration: BoxDecoration(
              color: color ?? Color(0xFFF3F4FA),
//                color: Colors.purple[800].withOpacity(0.6),
//                border: Border.all(color: Colors.grey[500]),
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
