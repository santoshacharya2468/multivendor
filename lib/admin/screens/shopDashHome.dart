import "package:flutter/material.dart";
import "../../widgets/myappbar.dart";

class ShopDashHome extends StatefulWidget {
  @override
  _ShopDashHomeState createState() => _ShopDashHomeState();
}

class _ShopDashHomeState extends State<ShopDashHome> {
  final List<Map<String, dynamic>> iconsList = [
    {"id": 2, "icon": Icons.store, "iconText": "Shop Profile"},
    {"id": 2, "icon": Icons.mouse, "iconText": "No. Clicks"},
    {"id": 3, "icon": Icons.favorite, "iconText": "Reg. in Shop"},
    {"id": 4, "icon": Icons.list, "iconText": "Upgrade Category"},
    {"id": 5, "icon": Icons.adjust, "iconText": "Upgrade Adverts"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, search: false, pin: false),
      body: Container(
        //color: Colors.red,
        padding: const EdgeInsets.all(7),
       height: 80,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: shopLogo(),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child:
                    buildIcon(iconsList[0]['icon'], iconsList[0]['iconText']),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child:
                    buildIcon(iconsList[1]['icon'], iconsList[1]['iconText']),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child:
                    buildIcon(iconsList[2]['icon'], iconsList[2]['iconText']),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child:
                    buildIcon(iconsList[3]['icon'], iconsList[3]['iconText']),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child:
                    buildIcon(iconsList[4]['icon'], iconsList[4]['iconText']),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        "assets/images/logo3.jpg",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildIcon(IconData iconDisplay, String iconText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 17.0,
            child:
                // Center(
                //     child:
                //         Image.asset(
                //           departments[index]['icon'],
                //           height: 35.0,
                //           width: 35.0,
                //           fit: BoxFit.cover,
                //           color: Colors.white,
                //         ),
                //         Icon(iconDisplay)),
                Icon(
              iconDisplay,
              color: Theme.of(context).accentColor,
              size: 25.0,
            )),
        Center(
          child: Text(
            iconText,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
