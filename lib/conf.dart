import 'package:checkshopsonline/admin/screens/shopDashHome.dart';
import 'package:checkshopsonline/main.dart';
import 'package:checkshopsonline/screens/shop_by_deparement.dart';
import 'package:flutter/material.dart';
import 'models/deal.dart';
import 'screens/latest_deals.dart';
import 'screens/product_detail.dart';
import 'screens/selections.dart';
import 'screens/shop_detail.dart';

class RouterGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
      return MaterialPageRoute(builder: (context)=>MyHomePage());
      case "shop_detail":
      return MaterialPageRoute(builder: (context)=>ShopDetail(settings.arguments));
      case 'shop_by_dep':
      return MaterialPageRoute(builder: (context)=>ShopByDep(settings.arguments));
      case 'product_detail':
      return MaterialPageRoute(builder: (context)=>ProductDetail(vmodel: settings.arguments,));
      case 'selection_list':
      return MaterialPageRoute(builder: (context)=>SelectionScreen());
      case 'latest_deals':
      return MaterialPageRoute(builder: (context)=>LatesetDeals());
      case "shop_dash_home":
      return MaterialPageRoute(builder:(context)=>ShopDashHome());
      default:
      return  null;
    }

  }
}
 final List<String> imgList = [
    "assets/images/img_3.jpg",
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
  ];
List<Deal> deals=[
  Deal(caption: "Nice",isImage: false,mediaUrl: "https://www.youtube.com/watch?v=KmzdUe0RSJo"),
  Deal(caption: "Nice",isImage: true,mediaUrl:"assets/images/img_3.jpg"),
  Deal(caption: "Nice",isImage: true,mediaUrl:"assets/images/img_1.jpg"),
  Deal(caption: "Nice",isImage: true,mediaUrl:"assets/images/img_1.jpg"),
];