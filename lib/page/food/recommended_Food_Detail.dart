import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/controllers/recommended_product_controllers.dart';
import 'package:flutter_application_1/routesPages/route_helper.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:flutter_application_1/widgit/app_icon.dart';
import 'package:flutter_application_1/widgit/big-text.dart';
import 'package:flutter_application_1/widgit/expandable_text_widfit.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../controllers/cart_controller.dart';
//import 'dart:js';

class recommendedFoodDetail extends StatelessWidget {
  final int pageID;
  const recommendedFoodDetail({Key? key, required this.pageID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductlist[pageID];
    Get.find<popularProductController>()
        .InitProduct(product, Get.find<cartController>());
    var total = Get.find<popularProductController>().totalItems;
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      Get.toNamed(routeHelper.getInitial()),
                    },
                    child: appIcon(icon: Icons.clear),
                  ),
                  //appIcon(icon: Icons.shopping_cart_outlined)
                  GetBuilder<popularProductController>(builder: (
                    cont,
                  ) {
                    return Stack(
                      children: [
                        appIcon(icon: Icons.shopping_bag_outlined),
                        total >= 1
                            ? Positioned(
                                left: 0,
                                top: 0,
                                child: appIcon(
                                  icon: Icons.circle_notifications,
                                  bakgroundColor: Colors.blueAccent,
                                  size: 20,
                                  iconColor: Colors.transparent,
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
                  }),
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    child: Center(child: BigText(text: product.name!)),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )),
                  )),
              pinned: true,
              expandedHeight: 250,
              backgroundColor: Colors.yellowAccent,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  appConstants.BASE_URL + "/uploads/" + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  child: expandableText(
                    text: product.description!,
                  ),
                  margin: EdgeInsets.only(left: 12, right: 12),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<popularProductController>(builder: (controllers) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controllers.setquantity(false);
                      },
                      child: appIcon(
                        iconColor: Colors.white,
                        bakgroundColor: Color.fromARGB(255, 54, 67, 61),
                        icon: Icons.remove,
                        iconSize: 30,
                      ),
                    ),
                    BigText(
                        text:
                            "\$ ${product.price!}  x  ${controllers.inCartItems}"),
                    GestureDetector(
                      onTap: () {
                        controllers.setquantity(true);
                      },
                      child: appIcon(
                        iconColor: Colors.white,
                        bakgroundColor: Colors.greenAccent,
                        icon: Icons.add,
                        iconSize: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Colors.teal[50],
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: appIcon(
                          iconColor: Colors.greenAccent, icon: Icons.favorite),
                    ),
                    GestureDetector(
                      onTap: () {
                        controllers.addItem(product);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.greenAccent,
                        ),
                        child: BigText(
                          text: "\ ${product.price!} | Add to cart",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }));
  }
}
