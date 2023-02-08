import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/page/food/food_detels.dart';
import 'package:flutter_application_1/page/food/recommended_Food_Detail.dart';
import 'package:flutter_application_1/page/home/main_food_page.dart';
import 'package:get/get.dart';
//import 'dart:js';

class routeHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static String getInitial() => '$initial';
  static String getpopularFood(int pageID) => '$popularFood?pageId=$pageID';
  static String getREcommendedFood(int PageID) =>
      '$recommendedFood?pageid=$PageID';
  static List<GetPage> routesPage = [
    GetPage(name: '/', page: (() => mainhome())),
    GetPage(
        name: "/popular-food",
        page: (() {
          var pageId = Get.parameters['pageId'];

          return popularFoodDetail(pageID: int.parse(pageId!));
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: (() {
          var pageId = Get.parameters['pageid'];
          return recommendedFoodDetail(pageID: int.parse(pageId!));
        }),
        transition: Transition.fadeIn),
  ];
}
