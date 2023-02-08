import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgit/big-text.dart';
import 'package:flutter_application_1/widgit/small_text.dart';
//import 'dart:js';
import 'food_page-bady.dart';

class mainhome extends StatefulWidget {
  const mainhome({Key? key}) : super(key: key);

  @override
  _mainhomeState createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45, bottom: 15),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "contrey",
                      color: Colors.red[300],
                      size: 30,
                    ),
                    Row(children: [
                      smallText(
                        text: "naigeria",
                        color: Colors.orange,
                      ),
                      Icon(Icons.arrow_drop_down_rounded)
                    ])
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: foodpagebady(),
        ))
      ],
    ));
  }
}
