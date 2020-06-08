import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  final selectedDepartmentId;
  DepartmentList({this.selectedDepartmentId});
  @override
  _DepartmentListState createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
  final List<Map<String, dynamic>> departments = [
    {"id": 1, "name": "Fashion", "icon": "assets/images/hanger.png"},
    {
      "id": 2,
      "name": "Furniture & Appliance",
      "icon": "assets/images/sofa.png"
    },
    {"id": 3, "name": "Home Deco", "icon": "assets/images/living-room.png"},
    {"id": 4, "name": "Leisure", "icon": "assets/images/sofa.png"},
    {"id": 5, "name": "FoodsStuff", "icon": "assets/images/fork.png"},
    {"id": 6, "name": "Vechicles", "icon": "assets/images/car.png"},
    {"id": 7, "name": "Services", "icon": "assets/images/support.png"},
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 100.0,
      width: deviceSize.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: departments.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, "shop_by_dep",
                  (route) => route.settings.name == "/" ? true : false,
                  arguments: departments[index]);
              // Navigator.pushReplacementNamed(context, 'shop_by_dep',
              //     arguments: departments[index]);
            },
            child: Container(
              width: 70.0,
              //margin: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor:
                        widget.selectedDepartmentId != departments[index]['id']
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                    radius: 25.0,
                    child: Center(
                      child: Image.asset(
                        departments[index]['icon'],
                        height: 35.0,
                        width: 35.0,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      departments[index]['name'],
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
