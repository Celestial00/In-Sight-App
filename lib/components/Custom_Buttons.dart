import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color text_color;
  final Color btn_color;
  final String pre_icon;
  final bool isIcon;
  Custom_Button(
      {required this.text,
      required this.onPressed,
      super.key,
      this.text_color = Colors.white,
      this.btn_color = Colors.white,
      this.pre_icon = "",
      this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: btn_color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Sec_Color, width: 2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isIcon
                    ? Image.asset(
                  pre_icon, 
                  width: 20, 
                )
                    : Container(),
                
                SizedBox(
                  width: 20,
                ),
                Ubuntu_Style_Text(text: text, fontSize: 18, color: text_color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Google_SignUp_Button extends StatefulWidget {
//   const Google_SignUp_Button({super.key});

//   @override
//   State<Google_SignUp_Button> createState() => _Google_SignUp_ButtonState();
// }

// class _Google_SignUp_ButtonState extends State<Google_SignUp_Button> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
