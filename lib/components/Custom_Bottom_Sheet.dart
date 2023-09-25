// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/subscription_card.dart';

class Custom_Subscrption_Page extends StatefulWidget {
  @override
  State<Custom_Subscrption_Page> createState() =>
      _Custom_Subscrption_PageState();
}

class _Custom_Subscrption_PageState extends State<Custom_Subscrption_Page> {
  double _textSize(BuildContext context, double size) {
    // Calculate responsive text size based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return size * screenWidth / 375.0; // Adjust 375 as per your design reference width
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _textSize(context, 20),
          vertical: _textSize(context, 30),
        ),
        child: Column(
          children: [
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
                    size: _textSize(context, 30),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _textSize(context, 10),
            ),
            Text(
              "Try Subscription free for 7 days",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: _textSize(context, 35),
                color: Sec_Color,
              ),
            ),
            SizedBox(
              height: _textSize(context, 20),
            ),
            Text(
              "After 7 days, your subscription will start and you will be charged \$4.99/month",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: _textSize(context, 18),
                color: Sec_Color,
              ),
            ),
            SizedBox(
              height: _textSize(context, 20),
            ),
            Subscription_card(
              title: "Monthly Subscription",
              discount: "save 20%",
              description: "Billed monthly",
            ),
            SizedBox(
              height: _textSize(context, 20),
            ),
            Subscription_card(
              title: "Yearly Subscription",
              discount: "save 5%",
              description: "Billed yearly",
            ),
          ],
        ),
      ),
    );
  }
}
