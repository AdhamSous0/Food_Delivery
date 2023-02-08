import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgit/small_text.dart';
import 'package:js/js.dart';

class iconandText extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconcolor;
  const iconandText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
        ),
        SizedBox(
          width: 5,
        ),
        smallText(
          text: text,
        )
      ],
    );
  }
}
