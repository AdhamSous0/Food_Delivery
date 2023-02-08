import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:get/get.dart';
//import 'package:js/js.dart';

class apiClinet extends GetConnect implements GetxService {
  late String token;
  final String appBaseUsl;
  late Map<String, String> _mainHeaders;
  apiClinet({required this.appBaseUsl}) {
    baseUrl = appBaseUsl;
    timeout = Duration(
        seconds:
            30); //this is a time for how long requst should try and after the wheter it should continue or not
    token = appConstants.TOKEN;
    _mainHeaders = {
      'content-type': 'application/json; chatset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response respnse =
          await get(uri); //he wont only endpoint not completly url
      return respnse;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
