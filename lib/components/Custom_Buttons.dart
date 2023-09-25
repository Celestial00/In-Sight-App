import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color text_color;
  final Color btn_color;
  final String pre_icon;
  final bool isIcon;

  Custom_Button({
    required this.text,
    required this.onPressed,
    this.text_color = Colors.white,
    this.btn_color = Colors.white,
    this.pre_icon = "",
    this.isIcon = false,
  });

  double _textSize(BuildContext context, double size) {
    // Calculate responsive text size based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return size *
        screenWidth /
        375; // Adjust 375 as per your design reference width
  }

  double _paddingSize(BuildContext context, double size) {
    // Calculate responsive padding based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    return size *
        screenWidth /
        375; // Adjust 375 as per your design reference width
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _paddingSize(context, 20)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: _paddingSize(context, 55),
          decoration: BoxDecoration(
            color: btn_color,
            borderRadius: BorderRadius.circular(_paddingSize(context, 30)),
            border:
                Border.all(color: Sec_Color, width: _paddingSize(context, 2)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isIcon
                    ? Image.asset(
                        pre_icon,
                        width: _paddingSize(context, 20),
                      )
                    : Container(),
                SizedBox(
                  width: _paddingSize(context, 20),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: _textSize(context, 18),
                    color: text_color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
