import 'package:checkshopsonline/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

Widget buildTopBar(BuildContext context, Shop shop) {
  final deviceSize = MediaQuery.of(context).size;
  return Container(
    height: 60.0,
    width: deviceSize.width,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 5.0),
        Image.asset(shop.logo, height: 60.0, width: 70.0, fit: BoxFit.cover),
        IconButton(
          icon: Icon(
            Icons.location_on,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.language,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.call,
              size: 30.0, color: Theme.of(context).primaryColor),
          onPressed: () async {
            if (await launcher.canLaunch(shop.mobileNumnber)) {
              launcher.launch("tel:${shop.mobileNumnber}");
            }
          },
        ),
        IconButton(
          icon: Icon(
            Icons.smartphone,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            "assets/images/facebook.png",
            height: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () async {
            if (await launcher.canLaunch(shop.facebookUrl)) {
              launcher.launch("htpps:${shop.facebookUrl}");
            }
          },
        ),
        IconButton(
          icon: Icon(
            Icons.list,
            size: 30.0,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
