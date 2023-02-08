import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
//import 'package:js/js.dart';

class RecommendedProductRepo extends GetxService {
  final apiClinet apiCLinet;
  RecommendedProductRepo({required this.apiCLinet});
  Future<Response> getRecommendedProductRepo() async {
    return apiCLinet.getData(appConstants.RECOMMENDED_PRODUCT_URL);
  }
}
