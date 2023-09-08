// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/subscription_card.dart';

class Bottom_Sheet {
  Custom_Bottom_Sheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Sec_Color,
                      size: 30,
                    ))
              ],
            ),  
            SizedBox(
              height: 10,
            ),
            Ubuntu_Style_Text(
                text: "Try Subscription free for 7 days",
                fontSize: 35,
                color: Sec_Color),
            SizedBox(
              height: 20,
            ),
            Ubuntu_Style_Text(
                text:
                    "After 7 days, your subscription will start and you will be charged \$4.99/month",
                fontSize: 18,
                color: Sec_Color),
            SizedBox(
              height: 20,
            ),
            Subscription_Card(
                "Monthly Subscription", "save 20%", "Billed monthly"),
            SizedBox(
              height: 20,
            ),
            Subscription_Card(
                "Yearly Subscription", "save 5%", "Billed yearly"),
          ]),
        ),
      ),
        ),
      )
    );
  }
}
