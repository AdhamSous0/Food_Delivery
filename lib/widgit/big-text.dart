import 'package:flutter/cupertino.dart';
import 'package:js/js.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow Overflow;
  BigText(
      {Key? key,
      this.color = const Color(0xFF42A5F5),
      this.Overflow = TextOverflow.ellipsis,
      this.size = 20,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1, //عشان ينكتب على سطر واحد
        overflow: Overflow, //عشان اذا كانت الكلمه اكبر من سظر يحطه نقاط
        style: TextStyle(
          fontFamily: 'Roman',
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.left);
  }
}
