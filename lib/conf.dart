import 'package:checkshopsonline/main.dart';
import 'package:checkshopsonline/screens/shop_by_deparement.dart';
import 'package:flutter/material.dart';
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
      default:
      return  null;
    }

  }
}