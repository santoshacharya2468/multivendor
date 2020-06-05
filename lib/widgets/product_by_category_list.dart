import 'package:checkshopsonline/models/product.dart';
import 'package:checkshopsonline/models/productviewmodel.dart';
import 'package:checkshopsonline/models/shop.dart';
import 'package:flutter/material.dart';

class ProductByCategoryList extends StatefulWidget {
  final List<Product> products;
  final String categoryName;
  final Shop shop;
  ProductByCategoryList({this.products, this.categoryName, this.shop});
  @override
  _ProductByCategoryListState createState() => _ProductByCategoryListState();
}

class _ProductByCategoryListState extends State<ProductByCategoryList> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      // height: 200.0,
      width: deviceSize.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //show the page with with product of selected categories
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("View All"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 130.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'product_detail',
                          arguments: ProductViewModel(
                            product: widget.products[index],
                            shop: widget.shop,
                          ));
                    },
                    child: Container(
                      width: 100.0,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              product.imageUrl[0],
                              fit: BoxFit.cover,
                            ),
                            Text(product.name, overflow: TextOverflow.ellipsis),
                            Text(
                              "Rs ${product.price}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
