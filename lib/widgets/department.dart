import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  @override
  _DepartmentListState createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
   final List<Map<String, String>> departments = [

    {"name": "Fashion", "icon": "assets/images/hanger.png"},

    {"name": "Furniture & Appliance", "icon": "assets/images/sofa.png"},

    {"name": "Home Deco", "icon": "assets/images/living-room.png"},

    {"name": "Leisure", "icon": "assets/images/sofa.png"},

    {"name": "FoodsStuff", "icon": "assets/images/fork.png"},

    {"name": "Vechicles", "icon": "assets/images/car.png"},

    {"name": "Services", "icon": "assets/images/support.png"},

  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;
    return Container(
                  height: 100.0,
                  width: deviceSize.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: departments.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 70.0,
                        //margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 30.0,
                              child: Center(
                                child: Image.asset(
                                  departments[index]['icon'],
                                  height: 40.0,
                                  width: 40.0,
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                departments[index]['name'],
                                overflow: TextOverflow.clip,
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
  }
}