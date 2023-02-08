import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/widgit/app_colunm.dart';
import 'package:flutter_application_1/widgit/app_icon.dart';
import 'package:flutter_application_1/widgit/expandable_text_widfit.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import '../../widgit/big-text.dart';
import '../../widgit/icon_and_text_wigeat.dart';
import '../../widgit/small_text.dart';
import 'package:flutter_application_1/routesPages/route_helper.dart';

import '../cart/cart_page.dart';

//import 'dart:js';

class popularFoodDetail extends StatelessWidget {
  int pageID;
  popularFoodDetail({Key? key, required this.pageID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<popularProductController>().popularProductlist[pageID];
    Get.find<popularProductController>()
        .InitProduct(product, Get.find<cartController>());
    var total = Get.find<popularProductController>().totalItems;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          appConstants.BASE_URL + "/uploads/" + product.img!)),
                ),
              )),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (() => {
                          Get.toNamed(routeHelper.initial),
                        }),
                    child: appIcon(icon: Icons.arrow_back)),
                GetBuilder<popularProductController>(builder: (
                  cont,
                ) {
                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(() => cartBage());
                          },
                          child: appIcon(icon: Icons.shopping_bag_outlined)),
                      total >= 1
                          ? GestureDetector(
                              onTap: () {},
                              child: Positioned(
                                left: 0,
                                top: 0,
                                child: appIcon(
                                  icon: Icons.circle_notifications,
                                  bakgroundColor: Colors.blueAccent,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                ),
                              ),
                            )
                          : Container(),
                      Positioned(
                        left: 3,
                        top: 3,
                        child: BigText(
                          text: total.toString(),
                          size: 12,
                          color: Colors.red,
                        ),
                      )
                    ],
                  );
                })
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 300,
              child: Container(
                height: 250,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appColunm(title: product.name!),
                    SizedBox(
                      height: 10,
                    ),
                    BigText(text: "intrduos"),
                    Expanded(
                        child: SingleChildScrollView(
                            child: expandableText(text: product.description!))),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<popularProductController>(builder: (popularProduct) {
        return Container(
          height: 100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setquantity(false);
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setquantity(true);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.greenAccent,
                ),
                child: GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                    text: "\$ ${product.price!}" + "| Add to cart",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
