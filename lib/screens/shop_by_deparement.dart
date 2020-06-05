import 'package:checkshopsonline/widgets/department.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:checkshopsonline/widgets/shop_list.dart';
import 'package:checkshopsonline/widgets/slider.dart';
import 'package:flutter/material.dart';

class ShopByDep extends StatefulWidget {
 final  Map<String,dynamic> dep;
  ShopByDep(this.dep);
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopByDep>{
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
                DepartmentList(selectedDepartmentId: widget.dep['id'],),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text("${widget.dep['name']} Shops",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25.0,
                        ))
                        ),
              ],
            ),
          ),
          
          //shop list widget
         ShopList()
        ]),
      ),
    );
  }
}
