import 'package:flutter/material.dart';

import '../conf.dart';

class DepartmentList extends StatefulWidget {
  final selectedDepartmentId;
  DepartmentList({this.selectedDepartmentId});
  @override
  _DepartmentListState createState() => _DepartmentListState();
}

class _DepartmentListState extends State<DepartmentList> {
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
