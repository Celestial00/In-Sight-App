import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';

Widget Subscription_Card(String title, String discount, String description) {
  return Container(
    height: 240,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1.5),
    ),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Oxygen_Style_Text(title, 30, Sec_Color, FontWeight.bold),
        SizedBox(
          height: 20,
        ),
        Oxygen_Style_Text(discount, 20, Sec_Color, FontWeight.w500),
        SizedBox(
          height: 20,
        ),
        Oxygen_Style_Text(
          description,
          20,
          Sec_Color,
          FontWeight.w500,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
            color: Sec_Color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Oxygen_Style_Text(
                "Start free trial", 20, Colors.white, FontWeight.normal),
          ),
        ),
      ],
    ),
  );
}
