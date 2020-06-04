import 'package:checkshopsonline/widgets/department.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:checkshopsonline/widgets/product_list.dart';
import 'package:checkshopsonline/widgets/slider.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
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
