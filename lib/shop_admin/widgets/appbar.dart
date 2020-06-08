import 'package:flutter/material.dart';

AppBar buildAppBarAccount(BuildContext context, {bool login: false}) {
  return AppBar(
        iconTheme: IconThemeData(color: Colors.white),
    automaticallyImplyLeading: false,
   
    title: Row(
      children: <Widget>[
        Image.asset("assets/images/logo3.jpg", height: 60, width: 90),
        SizedBox(width:20.0),
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/",
              (route) => route.settings.name == "/" ? true : false,
            );
          },
        ),
      ],
    ),
    actions: <Widget>[
      !login
          ? IconButton(icon: Icon(Icons.lock), onPressed: () {
            Navigator.pushNamed(context, "login");
          })
          : Container(height: 0, width: 0),
    ],
  );
}
