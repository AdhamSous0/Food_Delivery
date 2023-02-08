import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
//import 'package:js/js.dart';

class popularProductRepo extends GetxService {
  final apiClinet apiCLinet;
  popularProductRepo({required this.apiCLinet});
  Future<Response> getpopularProductRepo() async {
    return apiCLinet.getData(appConstants.POPULAR_PRODUCT_URL);
  }
}
