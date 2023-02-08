import 'package:flutter_application_1/data/repository/recommanded_productr_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';
//import 'package:js/js.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRep;
  bool _isloded = false;
  bool get isloded => _isloded;
  RecommendedProductController({required this.recommendedProductRep});
  List<dynamic> _recommendedProductlist = [];
  List<dynamic> get recommendedProductlist => _recommendedProductlist;

  Future<void> getRecommendedProductlist() async {
    Response response = await recommendedProductRep.getRecommendedProductRepo();
    if (response.statusCode == 200) {
      _recommendedProductlist = [];
      _recommendedProductlist.addAll(Product.fromJson(response.body).products);
      print(_recommendedProductlist);
      _isloded = true;
      update();
      ; //such as setstat
    } else {}
  }
}
