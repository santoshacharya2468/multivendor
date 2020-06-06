import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:flutter/material.dart';

class LatesetDeals extends StatelessWidget {
  final List<String> imgList = [
    "assets/images/img_3.jpg",
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
    "assets/images/img_3.jpg",
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: <Widget>[
            Container(
              height: 70.0,
              width: deviceSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0,top:8.0),
                    child: Text("Latest Deals",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        margin: const EdgeInsets.only(top: 2.0),
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Icon(
                          Icons.apps,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      Text("All categories")
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: imgList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 3,
                    // crossAxisSpacing: 2.0,
                    // mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            imgList[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
            ),
          ],
        ));
  }
}
