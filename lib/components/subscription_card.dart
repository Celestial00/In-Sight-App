import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';

class Subscription_card extends StatelessWidget {
  Subscription_card({
    required this.title,
    required this.discount,
    required this.description,
    Key? key,
  }) : super(key: key);

  String title;
  String discount;
  String description;

  double _textSize(BuildContext context, double size) {
    // Calculate responsive text size based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return size * screenWidth / 375.0; // Adjust 375 as per your design reference width
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _textSize(context, 230),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _textSize(context, 20),
          ),
          Oxygen_Style_Text(title, _textSize(context, 30), Sec_Color, FontWeight.bold),
          SizedBox(
            height: _textSize(context, 20),
          ),
          Oxygen_Style_Text(discount, _textSize(context, 20), Sec_Color, FontWeight.w500),
          SizedBox(
            height: _textSize(context, 20),
          ),
          Oxygen_Style_Text(
            description,
            _textSize(context, 20),
            Sec_Color,
            FontWeight.w500,
          ),
          SizedBox(
            height: _textSize(context, 20),
          ),
          Container(
            height: _textSize(context, 50),
            width: _textSize(context, 250),
            decoration: BoxDecoration(
              color: Sec_Color,
              borderRadius: BorderRadius.circular(_textSize(context, 30)),
            ),
            child: Center(
              child: Oxygen_Style_Text(
                "Start free trial",
                _textSize(context, 20),
                Colors.white,
                FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
