import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSlider1 extends StatefulWidget {
  @override
  _CarouselSlider1State createState() => _CarouselSlider1State();
}

class _CarouselSlider1State extends State<CarouselSlider1> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1.01,
          autoPlayInterval: Duration(seconds: 5),
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1800),
          onPageChanged: (index, n) {
            setState(() {
              _currentIndex = index;
            });
          }),
      items: CarouselImg.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.black.withOpacity(0.2),
//                    offset: Offset(0, 0.0),
//                    blurRadius: 0.0,
//                    spreadRadius: 0.0,
//                  )
//                ],
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(i),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  List<String> CarouselImg = [
    'assets/images/illustrate5.png',
    'assets/images/illustrate2.png',
    'assets/images/illustrate3.png',
    'assets/images/illustrate4.png',
    'assets/images/illustrate1.jpg',
    'assets/images/illustrate6.jpeg',
  ];
}
