import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';
//import 'package:js/js.dart';

class popularProductController extends GetxController {
  final popularProductRepo popularProductRep;
  bool _isloded = false;
  bool get isloded => _isloded;
  int _quantity = 0;
  int get quantity => _quantity;
  late cartController _cart;
  popularProductController({required this.popularProductRep});
  List<dynamic> _popularProductlist = [];
  List<dynamic> get popularProductlist => _popularProductlist;
  int _inCardItems = 0;
  int get inCartItems => _inCardItems + _quantity;
  Future<void> getPopularProductlist() async {
    Response response = await popularProductRep.getpopularProductRepo();
    if (response.statusCode == 200) {
      _popularProductlist = [];
      _popularProductlist.addAll(Product.fromJson(response.body).products);
      print(_popularProductlist);
      _isloded = true;
      update();
      ; //such as setstat
    } else {}
  }

  void setquantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity + _inCardItems < 0) {
      Get.snackbar(
        "Item count",
        "you can't reduce more!",
        backgroundColor: Colors.lightBlue,
        colorText: Colors.white,
      );
      if (_inCardItems > 0) {
        _quantity = _inCardItems;
        return _quantity;
      }
      return 0;
    } else if (quantity + _inCardItems > 20) {
      Get.snackbar(
        "Item count",
        "you can't add more!",
        backgroundColor: Colors.lightBlue,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void InitProduct(ProductModel product, cartController cart) {
    _quantity = 0;
    _inCardItems = 0;
    _cart = cart;
    var exiest = false;
    exiest = _cart.existInCart(product);
    if (exiest) {
      _inCardItems = _cart.getquantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCardItems = _cart.getquantity(product);
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<cartModel> get getItems {
    return _cart.getItems;
  }
}
