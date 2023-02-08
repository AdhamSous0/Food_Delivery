import 'dart:developer';
import 'dart:ffi';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/controllers/popular_Product_controllers.dart';
import 'package:flutter_application_1/controllers/recommended_product_controllers.dart';
import 'package:flutter_application_1/routesPages/route_helper.dart';
import 'package:flutter_application_1/utiles/app_constants.dart';
import 'package:flutter_application_1/utiles/dimenion.dart';
import 'package:flutter_application_1/widgit/big-text.dart';
import 'package:flutter_application_1/widgit/icon_and_text_wigeat.dart';
import 'package:flutter_application_1/widgit/small_text.dart';
import 'package:get/get.dart';
import '../../controllers/popular_Product_controllers.dart';
import '../../widgit/app_colunm.dart';
import '../food/food_detels.dart';
//import 'dart:js';

class foodpagebady extends StatefulWidget {
  const foodpagebady({Key? key}) : super(key: key);

  @override
  _foodbadyState createState() => _foodbadyState();
}

class _foodbadyState extends State<foodpagebady> {
  PageController pageController = PageController(viewportFraction: .85);
  var _carentvalue = 0.0;
  var _scalvactor = .85;
  var _height = 200;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        //  print(MediaQuery.of(context).size.height); //for get height the devis

        _carentvalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<popularProductController>(builder: (popularProducts) {
          // the value inside the parmiter you can put any name
          return popularProducts.isloded
              ? Container(
                  height: Dimenions.bigepageviwecontroular,
                  // color: Colors.redAccent,

                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductlist.length <= 0
                          ? 1
                          : popularProducts.popularProductlist.length,
                      itemBuilder: (context, Position) {
                        return _bildepageIteem(Position,
                            popularProducts.popularProductlist[Position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        }),
        GetBuilder<popularProductController>(builder: (popularProducts) {
          return new DotsIndicator(
            dotsCount: popularProducts.popularProductlist.length,
            position: _carentvalue,
            decorator: DotsDecorator(
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        SizedBox(
          height: 50,
        ),
        smallText(text: "Recommeded"),
        SizedBox(
          height: 10,
        ),
        //////
        GetBuilder<RecommendedProductController>(builder: (recommanded) {
          return recommanded.isloded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommanded.recommendedProductlist.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => {
                        Get.toNamed(routeHelper.getREcommendedFood(index)),
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 10),
                        child: Row(children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white10,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(appConstants.BASE_URL +
                                        "/uploads/" +
                                        recommanded
                                            .recommendedProductlist[index]
                                            .img!))),
                          ),
                          //texst
                          Expanded(
                            //forfill all rhite saide
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: recommanded
                                            .recommendedProductlist[index]
                                            .name!),
                                    smallText(
                                        text: "With chinese characterstics"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        iconandText(
                                            icon: Icons.circle_sharp,
                                            text: "normal",
                                            iconcolor: Colors.orange),
                                        iconandText(
                                            icon: Icons.location_on,
                                            text: "1.9k",
                                            iconcolor: Colors.blue),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        iconandText(
                                            icon: Icons.access_alarms_rounded,
                                            text: "30min",
                                            iconcolor: Colors.pink),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: Colors.blueAccent,
                );
        })

        ///
      ],
    );
  }

  Widget _bildepageIteem(int index, popularProducts) {
    Matrix4 matrex = new Matrix4.identity();

    if (index == _carentvalue.floor()) {
      var curntscal = 1 - (_carentvalue - index) * (1 - _scalvactor);
      var curntras = _height * (1 - curntscal) / 2;
      matrex = Matrix4.diagonal3Values(1, curntscal, 1)
        ..setTranslationRaw(0, curntras, 0);
    } else if (index == _carentvalue.floor() + 1) {
      var curntscal =
          _scalvactor + (_carentvalue - index + 1) * (1 - _scalvactor);
      var curntras = _height * (1 - curntscal) / 2;
      matrex = Matrix4.diagonal3Values(1, curntscal, 1)
        ..setTranslationRaw(0, curntras, 0);
    } else if (index == _carentvalue.floor() - 1) {
      var curntscal = 1 - (_carentvalue - index) * (1 - _scalvactor);
      var curntras = _height * (1 - curntscal) / 2;
      matrex = Matrix4.diagonal3Values(1, curntscal, 1)
        ..setTranslationRaw(0, curntras, 0);
    } else {
      var curntscal = .85;
      matrex = Matrix4.diagonal3Values(1, curntscal, 1)
        ..setTranslationRaw(0, _height * (0 - curntscal) / 2, 1);
    }
    return Transform(
      transform: matrex,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => {
              Get.toNamed(routeHelper.getpopularFood(index)),
            },
            child: Container(
              height: Dimenions.smalepageviwecontroular,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Colors.yellowAccent : Colors.red,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(appConstants.BASE_URL +
                          "/uploads/" +
                          popularProducts.img!))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimenions.pageviwetextcontroular,
                //width: 240,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigo,
                          blurRadius: .5,
                          offset: Offset(0, 5))
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimenions.height15, right: 5, left: 5),
                  child: appColunm(title: popularProducts.name!),
                )),
          ),
        ],
      ),
    );
  }
}
