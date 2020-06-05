import 'package:checkshopsonline/models/productviewmodel.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:checkshopsonline/widgets/slider.dart';
import 'package:checkshopsonline/widgets/topbar.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final ProductViewModel vmodel;

  ProductDetail({this.vmodel});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
              child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildTopBar(context, widget.vmodel.shop),
            Image.asset(widget.vmodel.product.imageUrl[0],
            width: deviceSize.width,
            height: deviceSize.height*.5,
            fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.vmodel.product.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Rs ${widget.vmodel.product.price}",
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).primaryColor
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx"),
            ),
            Center(
              child: Container(
                height: 45.0,
                width: 220.0,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text("Add to my selections",
                          style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    ],
                  )),
                  onPressed: () {},
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}