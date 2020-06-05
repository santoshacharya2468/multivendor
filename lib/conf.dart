import 'package:checkshopsonline/screens/shop_by_deparement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/shop_detail.dart';

class RouterGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "shop_detail":
      return MaterialPageRoute(builder: (context)=>ShopDetail(settings.arguments));
      case 'shop_by_dep':
      return MaterialPageRoute(builder: (context)=>ShopByDep(settings.arguments));
      default:
      return  null;
    }

  }
}