import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:flutter_application_1/utiles/dimenion.dart';
import 'package:flutter_application_1/widgit/app_icon.dart';
import 'package:flutter_application_1/widgit/big-text.dart';
import 'package:flutter_application_1/widgit/small_text.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routesPages/route_helper.dart';

class cartBage extends StatelessWidget {
  const cartBage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 30,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: appIcon(
                      icon: Icons.arrow_back,
                      iconColor: Colors.white,
                      bakgroundColor: Colors.blueAccent,
                      iconSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(routeHelper.getInitial());
                    },
                    child: appIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      bakgroundColor: Colors.blueAccent,
                      iconSize: 20,
                    ),
                  ),
                  appIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    bakgroundColor: Colors.blueAccent,
                    iconSize: 20,
                  ),
                ],
              )),
          Positioned(
              top: 80,
              left: 10,
              right: 10,
              bottom: 20,
              child: Container(
                  margin: EdgeInsets.only(top: 15),
                  //   color: Colors.red,
                  child: MediaQuery.removePadding(
                      context: context,
                      child: GetBuilder<popularProductController>(
                        builder: (CarProduct) {
                          return ListView.builder(
                              itemCount: CarProduct.getItems.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: 100,
                                  width: double.maxFinite,
                                  child: Row(children: [
                                    Container(
                                      width: 100,
                                      height: 200,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              appConstants.BASE_URL +
                                                  "/uploads/" +
                                                  CarProduct
                                                      .getItems[index].img!,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 150,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                              text: CarProduct
                                                  .getItems[index].name!,
                                              color: Colors.black45,
                                            ),
                                            smallText(text: "spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text:
                                                      "\$ ${CarProduct.getItems[index].price!.toString()}",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        // popularProduct.setquantity(false);
                                                      },
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    BigText(
                                                        text:
                                                            "0"), // popularProduct.inCartItems.toString()),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        //popularProduct.setquantity(true);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                                );
                              });
                        },
                      )))),
        ],
      ),
    );
  }
}
