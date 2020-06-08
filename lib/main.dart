import 'package:checkshopsonline/bloc/selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'conf.dart';
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
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SelectionBloc())],
      child: MaterialApp(
        onGenerateRoute: RouterGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color.fromRGBO(253, 184, 18, 1),
            accentColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            buttonTheme: ButtonThemeData(
                buttonColor: Color.fromRGBO(253, 184, 18, 1),
                textTheme: ButtonTextTheme.accent),
            iconTheme: IconThemeData(color: Colors.white)),
        home: MyHomePage(),
      ),
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
      appBar: buildAppBar(context, home: true),
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
                ImageSlider(deals),
                //departments didget
                DepartmentList(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "Latest Shops",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      // letterSpacing: 0.0,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Shop Dashboard"),
                    onPressed: () {
                      Navigator.pushNamed(context, "shop_dash_home");
                    },
                  ),
                )
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
