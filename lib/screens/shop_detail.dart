import 'package:checkshopsonline/models/product.dart';
import 'package:checkshopsonline/models/shop.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:checkshopsonline/widgets/product_by_category_list.dart';
import 'package:checkshopsonline/widgets/product_list.dart';
import 'package:checkshopsonline/widgets/slider.dart';
import 'package:checkshopsonline/widgets/topbar.dart';
import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  final Shop shop;
  ShopDetail(this.shop);
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  static final List<Product> products = [
    Product(
        id: '10',
        name: "Sweater",
        imageUrl: ["assets/images/sweater.jfif"],
        price: 220.5),
    Product(
        id: '20',
        name: "Tshirt",
        imageUrl: ["assets/images/tshirt.jpg"],
        price: 120.5),
    Product(
        id: '30',
        name: "Tshirt",
        imageUrl: ["assets/images/sweater.jfif"],
        price: 120.5),
    Product(
        id: '40',
        name: "Tshirt",
        imageUrl: ["assets/images/tshirt.jpg"],
        price: 120.5),
  ];
  static final categoires = [
    "Gents Wear",
    'Female Wear',
    'Cold weather',
    'Mausam',
    'Baby Wear'
  ];
  Widget buildGrid(int index, BuildContext context, Shop shop) {
    if (index == 0) {
      return ProductList();
    }
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductByCategoryList(
          products: products,
          categoryName: categoires[index],
          shop: shop,
        );
      }, childCount: categoires.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //crossAxisSpacing: 10.0
          childAspectRatio: MediaQuery.of(context).size.width / 170,
          mainAxisSpacing: 5.0),
    );
  }

  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
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
                buildTopBar(context, widget.shop),
                //image slider widget
                ImageSlider(),
                //shop prouducts and category view
                Container(
                    height: 30.0,
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    width: deviceSize.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageIndex = 0;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            width: deviceSize.width / 2 - 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _pageIndex == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                            child: Center(
                                child: Text(
                              "Latest Products",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageIndex = 1;
                            });
                          },
                          child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _pageIndex == 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                            width: deviceSize.width / 2 - 10,
                            child: Center(
                                child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            )),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          buildGrid(_pageIndex, context, widget.shop)
        ]),
      ),
    );
  }
}
