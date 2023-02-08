//import 'package:js/js.dart';

class cartModel {
  int? id;
  String? name;

  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  cartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  cartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];

    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExit'];
    time = json['time'];
  }
}
