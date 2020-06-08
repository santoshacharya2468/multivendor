import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context,
    {bool home = false, pin: true, search: true}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 25.0),
    automaticallyImplyLeading: false,
    actions: <Widget>[
      !home
          ? IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () {
                //Navigator.pushReplacementNamed(context, '/');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  (route) => route.settings.name == "/" ? true : false,
                );
              },
            )
          : Container(
              height: 0.0,
              width: 0.0,
            ),
      pin
          ? IconButton(
              icon: Image.asset(
                "assets/images/pin.png",
                height: 25.0,
                width: 25.0,
              ),
              onPressed: () {
                //selection_list
                Navigator.pushNamed(context, 'selection_list');
              },
            )
          : Container(height: 25.0, width: 25.0),
      IconButton(
        icon: Icon(
          Icons.share,
        ),
        onPressed: () {},
      ),
      search
          ? IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            )
          : Container(),
      // IconButton(
      //   icon: Icon(
      //     Icons.lock,
      //   ),

      //   onPressed: () {},5

      // ),
      FlatButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 12),
            Icon(
              Icons.lock,
            ),
            Text("Status"),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, "login");
        },
      ),
    ],
    title: Image.asset("assets/images/logo3.jpg", height: 60, width: 100),
    titleSpacing: 5.0,
  );
}
