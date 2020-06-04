import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> departments = [
    {"name": "Fashion", "icon": "assets/images/hanger.png"},
    {"name": "Furniture & Appliance", "icon": "assets/images/sofa.png"},
    {"name": "Home Deco", "icon": "assets/images/living-room.png"},
    {"name": "Leisure", "icon": "assets/images/sofa.png"},
    {"name": "FoodsStuff", "icon": "assets/images/fork.png"},
    {"name": "Vechicles", "icon": "assets/images/car.png"},
    {"name": "Services", "icon": "assets/images/support.png"},
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: CustomScrollView(key: GlobalKey(), slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Slider(),
                //departments
                Container(
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
                ),
                
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text("Latest Shops",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25.0,
                        ))),
              ],
            ),
          ),
          ShopList(),
        ]),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Slider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final List<String> imgList = [
    "assets/images/img_3.jpg",
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          width: deviceSize.width,
          height: 200.0,
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgList[index],
                    fit: BoxFit.cover,
                    width: deviceSize.width,
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Container(
                height: 30.0,
                width: 80.0,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  "All Deals",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class ShopList extends StatefulWidget {
  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final List<Map<String, dynamic>> _shops = [
    {"name": "General Cons", "image": "assets/images/genral-cons.jpg"},
    {"name": "Atol", "image": "assets/images/atol.jpg"},
    {"name": "Temple", "image": "assets/images/temple.jpg"},
    {"name": "Kolos", "image": "assets/images/genral-cons.jpg"},
    {"name": "Durell", "image": "assets/images/atol.jpg"},
    {"name": "Edendale", "image": "assets/images/genral-cons.jpg"},
    {"name": "General Cons", "image": "assets/images/genral-cons.jpg"},
    {"name": "Atol", "image": "assets/images/atol.jpg"},
    {"name": "Temple", "image": "assets/images/temple.jpg"},
    {"name": "Kolos", "image": "assets/images/genral-cons.jpg"},
    {"name": "Durell", "image": "assets/images/atol.jpg"},
    {"name": "Edendale", "image": "assets/images/genral-cons.jpg"},
    {"name": "General Cons", "image": "assets/images/genral-cons.jpg"},
    {"name": "Atol", "image": "assets/images/atol.jpg"},
    {"name": "Temple", "image": "assets/images/temple.jpg"},
    {"name": "Kolos", "image": "assets/images/genral-cons.jpg"},
    {"name": "Durell", "image": "assets/images/atol.jpg"},
    {"name": "Edendale", "image": "assets/images/genral-cons.jpg"},
    {"name": "General Cons", "image": "assets/images/genral-cons.jpg"},
    {"name": "Atol", "image": "assets/images/atol.jpg"},
    {"name": "Temple", "image": "assets/images/temple.jpg"},
    {"name": "Kolos", "image": "assets/images/genral-cons.jpg"},
    {"name": "Durell", "image": "assets/images/atol.jpg"},
    {"name": "Edendale", "image": "assets/images/genral-cons.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      // physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 3
                  : 4),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = _shops[index];
          return Card(
                      child: Container(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.cover,
                    height: 70.0,
                  ),
                ),
                Spacer(),
                Text(item['name'],
                style: TextStyle(
                  fontSize: 18.0,
                ),
                 overflow: TextOverflow.ellipsis),
              ]),
            ),
          );
        },
        childCount: _shops.length,
      ),
    );
  }
}
