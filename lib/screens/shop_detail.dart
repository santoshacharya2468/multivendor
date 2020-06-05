import 'package:checkshopsonline/models/shop.dart';
import 'package:checkshopsonline/widgets/department.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:checkshopsonline/widgets/product_list.dart';
import 'package:checkshopsonline/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
class ShopDetail extends StatefulWidget {
  final Shop shop;
  ShopDetail(this.shop);
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>
    with SingleTickerProviderStateMixin {
  final tabs = [
    ProductList(),
    SliverToBoxAdapter(
      child: Text("Category view"),
    )
  ];
  int _pageIndex = 0;
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

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
                //top bar
                Container(
                  height: 60.0,
                  width: deviceSize.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(width: 5.0),
                      Image.asset(widget.shop.logo,
                          height: 60.0, width: 70.0, fit: BoxFit.cover),
                      IconButton(
                        icon: Icon(
                          Icons.location_on,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.language,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.call,
                            size: 30.0, color: Theme.of(context).primaryColor),
                        onPressed: ()async {
                          if(await launcher.canLaunch(widget.shop.mobileNumnber)){
                            launcher.launch("tel:${widget.shop.mobileNumnber}");
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.smartphone,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          "assets/images/facebook.png",
                          height: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async{
                          if(await launcher.canLaunch(widget.shop.facebookUrl)){
                            launcher.launch("htpps:${widget.shop.facebookUrl}");
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                //image slider widget
                ImageSlider(),
                //departments widget
                DepartmentList(),
              ],
            ),
          ),
          //shop list widget
          SliverToBoxAdapter(
            child: TabBar(
                indicatorWeight: 1.0,
                onTap: (i) {
                  setState(() {
                    _pageIndex = i;
                  });
                },
                controller: tabController,
                tabs: [
                  Text("Latest Product",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: _pageIndex == 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey)),
                  Text("Category",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: _pageIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.grey))
                ]),
          ),
          tabs[_pageIndex]
        ]),
      ),
    );
  }
}
