import 'package:flutter/material.dart';

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