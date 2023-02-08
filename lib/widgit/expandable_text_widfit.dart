import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utiles/dimenion.dart';
import 'package:flutter_application_1/widgit/big-text.dart';
import 'package:flutter_application_1/widgit/small_text.dart';

class expandableText extends StatefulWidget {
  final String text;
  const expandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<expandableText> createState() => _expandableText();
}

class _expandableText extends State<expandableText> {
  @override
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = 350;
  void initState() {
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? smallText(
              text: firstHalf,
              height: 3,
              size: 15,
            )
          : Container(
              child: Column(children: [
                smallText(
                    text: hiddenText
                        ? (firstHalf + ".....")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      smallText(
                          height: 5, text: "show more", color: Colors.blueGrey),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
