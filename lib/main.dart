import 'package:checkshopsonline/screens/shop_detail.dart';
import 'package:flutter/material.dart';
import 'widgets/department.dart';
import 'widgets/myappbar.dart';
import 'widgets/shop_list.dart';
import 'widgets/slider.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShopDetail(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: CustomScrollView(key: GlobalKey(), slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //image slider widget
                ImageSlider(),
                //departments didget
                DepartmentList(),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text("Latest Shops",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25.0,
                        ))
                        ),
              ],
            ),
          ),
          //shop list widget
          ShopList(),
        ]),
      ),
    );
  }
}