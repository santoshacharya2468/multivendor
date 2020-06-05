import 'package:checkshopsonline/models/product.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: '1',
        name: "Sweater",
        imageUrl: ["assets/images/sweater.jfif"],
        price: 220.5),
    Product(
        id: '1',
        name: "Tshirt",
        imageUrl: ["assets/images/tshirt.jpg"],
        price: 120.5),
    Product(
        id: '1',
        name: "Sweater",
        imageUrl: ["assets/images/sweater.jfif"],
        price: 220.5),
    Product(
        id: '1',
        name: "Tshirt",
        imageUrl: ["assets/images/tshirt.jpg"],
        price: 120.5),
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context),
        
        body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var p = products[index];
              return Card(child: PinnedProductView(p));
            },
          ),
        ));
  }
}

class PinnedProductView extends StatefulWidget {
  final Product product;
  PinnedProductView(this.product);
  @override
  _PinnedProductViewState createState() => _PinnedProductViewState();
}

class _PinnedProductViewState extends State<PinnedProductView> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: deviceSize.width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 64.0,
              width: 64.0,
              child: Image.asset(
                widget.product.imageUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(widget.product.name),
                Text("Rs ${widget.product.price}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.product.selectedItem += 1;
                        });
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        color: Colors.grey,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0,),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      color: Colors.grey,
                      child: Center(child: Text("${widget.product.selectedItem}")),
                    ),
                    SizedBox(width: 5.0,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.product.selectedItem > 1) {
                            widget.product.selectedItem -= 1;
                          }
                        });
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        color: Colors.grey,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              height: 80.0,
              width: 25.0,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Icon(
                Icons.cancel,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
