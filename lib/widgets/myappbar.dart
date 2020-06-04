 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Image.asset("assets/images/pin.png"),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.lock,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () {},
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("  Check",
              style: TextStyle(fontSize: 25.0, color: Colors.grey[700])),
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Text(
                "  shopsOnline",
                style: GoogleFonts.pacifico(color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
      titleSpacing: 0.0,
    );
  }

