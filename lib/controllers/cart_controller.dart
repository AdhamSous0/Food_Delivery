import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/cart_repo.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/cart_repo.dart';

class cartController extends GetxController {
  final cartRepo cartREpo;
  cartController({required this.cartREpo});
  Map<int, cartModel> _item = {};
  Map<int, cartModel> get items => _item;
  void addItem(ProductModel product, int quantity) {
    if (_item.containsKey(product.id!)) {
      _item.forEach((key, value) {});
      _item.update(product.id!, (value) {
        print(value.toString() + "fake1");
        return cartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      if (quantity > 0) {
        _item.putIfAbsent(product.id!, () {
          print("o1");
          return cartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar(
          "Item count",
          "you can't add more!",
          backgroundColor: Colors.lightBlue,
          colorText: Colors.white,
        );
      }
      update();
    } //he will ceck if the key insert inside _item ,this methode for all map  the key mast be uniqu id in data bace all id is praimary key
  }

  bool existInCart(ProductModel product) {
    if (_item.containsKey(product.id!)) {
      return true;
    } else {
      return false;
    }
  }

  int getquantity(ProductModel prduct) {
    var quantity = 0;
    if (_item.containsKey(prduct.id!)) {
      _item.forEach((key, value) {
        if (key == prduct.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    int totalQuantiy = 0;
    _item.forEach((key, value) {
      totalQuantiy = totalQuantiy + value.quantity!;
    });
    return totalQuantiy;
  }

  List<cartModel> get getItems {
    return _item.entries.map((e) {
      return e.value;
    }).toList();
  }
}
