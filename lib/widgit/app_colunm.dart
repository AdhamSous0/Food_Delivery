import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgit/small_text.dart';
import '../utiles/dimenion.dart';
import 'big-text.dart';
import 'icon_and_text_wigeat.dart';
import 'package:js/js.dart';

class appColunm extends StatelessWidget {
  final String title;
  const appColunm({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: title,
        color: Colors.grey,
      ), //fun
      SizedBox(
        height: Dimenions.height10,
      ),
      Row(
        children: [
          Wrap(
              children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: Colors.blue,
              size: 15,
            );
          })),
          SizedBox(
            width: 10,
          ),
          smallText(text: "4.5"),
          SizedBox(
            width: 10,
          ),
          smallText(text: "1234"),
          SizedBox(
            width: 10,
          ),
          smallText(text: "comnents")
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconandText(
              icon: Icons.circle_sharp,
              text: "normal",
              iconcolor: Colors.orange),
          iconandText(
              icon: Icons.location_on, text: "1.9k", iconcolor: Colors.blue),
          iconandText(
              icon: Icons.access_alarms_rounded,
              text: "30min",
              iconcolor: Colors.pink),
        ],
      )
    ]);
  }
}
