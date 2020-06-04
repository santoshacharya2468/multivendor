import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final List<String> imgList = [
    "assets/images/img_3.jpg",
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: deviceSize.width,
          height: 200.0,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                    width: deviceSize.width,
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Container(
                height: 30.0,
                width: 80.0,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  "All Deals",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
