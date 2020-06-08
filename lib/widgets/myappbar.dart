import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context, {bool home = false, pin: true}) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 25.0),
    automaticallyImplyLeading: home ? false : true,
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
      IconButton(
        icon: Icon(
          Icons.search,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.lock,
        ),
        onPressed: () {},
      ),
    ],
    title: home
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text("  Check",
              //     style: TextStyle(fontSize: 25.0, color: Colors.grey[700])),
              Row(
                children: <Widget>[
                  SizedBox(width: 20.0),
                  // Text(
                  //   "  shopsOnline",
                  //   style: GoogleFonts.pacifico(color: Colors.grey[700]),
                  // ),
                  Image.asset("assets/images/logo3.jpg", height: 70, width: 100)
                ],
              ),
            ],
          )
        : Container(height: 0.0),
    titleSpacing: 0.0,
  );
}
