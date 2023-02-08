import 'package:get/get.dart';
import 'package:js/js.dart';

class Dimenions {
  static double screenHigeht = Get.context!.height;
  static double screenwidth = Get.context!.width;
  //hiof screan/hie of contenar=844/200=3.48
  //هتا من اجل جعل ان يكون حجم الكنتينر الخاص في  بعرض الطعام متساوي علي كل الاجهزه المحموله استخدمنا هذه الطريقهوالتي هيا
  //1حضر حجم الشاه وهنالك كود لاحضاره
  // 2=اقسمه على حجم المنتير
  //3-
  //الناتح والذي هو3.48
  //اضعه في المعاده لاخرج حجم الكنتينر
  static double bigepageviwecontroular =
      screenHigeht / 3.12; //this give me higeht of contenr of page view
  static double smalepageviwecontroular = screenHigeht / 3.9;
  static double pageviwetextcontroular =
      screenHigeht / 6.05; //this for higeht of thetx contenar
  static double height10 = screenHigeht / 78.1;
  static double height20 = screenHigeht / 39.05;
  static double height15 = screenHigeht / 52.07;
}
