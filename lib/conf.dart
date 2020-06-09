import 'package:checkshopsonline/main.dart';
import 'package:checkshopsonline/screens/shop_by_deparement.dart';
import 'package:flutter/material.dart';
import 'models/deal.dart';
import 'screens/latest_deals.dart';
import 'screens/product_detail.dart';
import 'screens/selections.dart';
import 'screens/shop_detail.dart';
import 'shop_admin/screeens/dashboard.dart';
import 'shop_admin/screeens/login.dart';
import 'shop_admin/screeens/register.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //all pages for client
      case '/':
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case "shop_detail":
        return MaterialPageRoute(
            builder: (context) => ShopDetail(settings.arguments));
      case 'shop_by_dep':
        return MaterialPageRoute(
            builder: (context) => ShopByDep(settings.arguments));
      case 'product_detail':
        return MaterialPageRoute(
            builder: (context) => ProductDetail(
                  vmodel: settings.arguments,
                ));
      case 'selection_list':
        return MaterialPageRoute(builder: (context) => SelectionScreen());
      case 'latest_deals':
        return MaterialPageRoute(builder: (context) => LatesetDeals());
        //from here shop-admin routes start
        case "login":
        return MaterialPageRoute(builder: (context)=>LoginPage());
         case "register":
        return MaterialPageRoute(builder: (context)=>RegisterPage());
        case "dashboard":
        return MaterialPageRoute(builder: (context)=>DashBoardPage());
      default:
        return null;
    }
  }
}
const apiKey="53465FDSFf##%#%%";
const baseUrl="http://192.168.1.153:8080/";
List<Deal> deals = [
  Deal(
      caption: "Nice",
      isImage: false,
      bannerImage: "assets/images/img_1.jpg",
      mediaUrl: "https://www.youtube.com/watch?v=KmzdUe0RSJo"),
  Deal(caption: "Nice", isImage: true, mediaUrl: "assets/images/img_3.jpg"),
  Deal(caption: "Nice", isImage: true, mediaUrl: "assets/images/img_2.jpg"),
  Deal(caption: "Nice", isImage: true, mediaUrl: "assets/images/img_1.jpg"),
];
