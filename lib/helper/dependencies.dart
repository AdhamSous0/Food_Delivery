import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/controllers/recommended_product_controllers.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/helper/dependencies.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/data/repository/recommanded_productr_repo.dart';
//import 'dart:js';

Future<void> init() async {
  //api clinet
  Get.lazyPut(() => apiClinet(appBaseUsl: appConstants.BASE_URL));
  //repos

  Get.lazyPut(() => popularProductRepo(apiCLinet: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiCLinet: Get.find()));
  Get.lazyPut(() => cartRepo());
//controllers

  Get.lazyPut(() => popularProductController(popularProductRep: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRep: Get.find()));
  Get.lazyPut(() => cartController(cartREpo: Get.find()));
}
