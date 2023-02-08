import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/page/cart/cart_page.dart';
import 'package:flutter_application_1/page/food/food_detels.dart';
import 'package:flutter_application_1/page/food/recommended_Food_Detail.dart';
import 'package:flutter_application_1/page/home/food_page-bady.dart';
import 'package:flutter_application_1/routesPages/route_helper.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
import 'page/home/main_food_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dp;
import 'dart:ffi';
import 'package:flutter_application_1/controllers/recommended_product_controllers.dart';
import 'package:js/js.dart';
import 'package:flutter_application_1/page/cart/cart_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //will make sure that your dep are loaded correctly and wait until they are loaded
  await dp.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<popularProductController>().getPopularProductlist();
    Get.find<RecommendedProductController>().getRecommendedProductlist();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primarySwatch: Colors.red,
          ),
      home: mainhome(),
      // initialRoute: routeHelper.initial, //The name of the first route to show
      getPages: routeHelper.routesPage,
    );
  }
}
