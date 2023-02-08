import 'package:flutter/cupertino.dart';
import 'package:js/js.dart';

class smallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  smallText(
      {Key? key,
      this.color = const Color(0xFF42A5F5),
      this.size = 12,
      this.height = 1.2, //البعد بين الاسطر
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roman',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        height: height,
      ),
    );
  }
}
