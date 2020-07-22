import 'package:checkshopsonline/admin/screens/shopDashHome.dart';
import 'package:checkshopsonline/main.dart';
import 'package:checkshopsonline/screens/shop_by_deparement.dart';
import 'package:flutter/material.dart';
import 'models/deal.dart';
import 'screens/latest_deals.dart';
import 'screens/product_detail.dart';
import 'screens/selections.dart';
import 'screens/shop_detail.dart';
import 'shop_admin/screeens/login.dart';
import 'shop_admin/screeens/register.dart';
  final List<Map<String, dynamic>> departments = [
    {"id": 1, "name": "Fashion", "icon": "assets/images/hanger.png"},
    {
      "id": 2,
      "name": "Furniture & Appliance",
      "icon": "assets/images/sofa.png"
    },
    {"id": 3, "name": "Home Deco", "icon": "assets/images/living-room.png"},
    {"id": 4, "name": "Leisure", "icon": "assets/images/sofa.png"},
    {"id": 5, "name": "FoodsStuff", "icon": "assets/images/fork.png"},
    {"id": 6, "name": "Vechicles", "icon": "assets/images/car.png"},
    {"id": 7, "name": "Services", "icon": "assets/images/support.png"},
  ];
  const List<String> packageDuration=[
    "3",
    "6",
    "12"

  ];
  const List<String> districts=[
"Port Louis",
"Pamplemousses",
"Rivière du Rempart",
"Plaines Wilhems",
"Moka",
"Flacq",
"Grand Port",
"Rivière Noire",
"Savanne",
"Rodrigues"
  ];
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
        return MaterialPageRoute(builder: (context)=>ShopDashHome());
      case 'latest_deals':
        return MaterialPageRoute(builder: (context) => LatesetDeals());
      case "login":
        return MaterialPageRoute(builder: (context) => LoginPage());
      case "register":
        return MaterialPageRoute(builder: (context) => RegisterPage());
      default:
        return null;
    }
  }
}

const apiKey="53465FDSFf##%#%%";
const baseUrl="http://10.0.2.2:8000/";
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
