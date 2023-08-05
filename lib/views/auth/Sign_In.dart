// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/Text_Field.dart';
import 'package:insight/components/custom_buttons.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGround_Color,
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "Welcome Back!",
              style: GoogleFonts.ptSerif(
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: Sec_Color),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text_Field(hint: "Email"),
          SizedBox(
            height: 20,
          ),
          Text_Field(hint: "Password"),
          SizedBox(
            height: 30,
          ),
          Custom_Button(
            text: "Sign In",
            onPressed: () {},
            text_color: Colors.white,
            isIcon: false,
            btn_color: Sec_Color,
          ),
          SizedBox(
            height: 30,
          ),
          Custom_Button(
            onPressed: () {},
            text: 'Sign in with Google',
            btn_color: Colors.white,
            text_color: Sec_Color,
            isIcon: true,
            pre_icon: "assets/google.png",
          ),
          SizedBox(
            height: 30,
          ),

          Custom_Button(
            onPressed: () {},
            text: 'Sign in with Facebook',
            btn_color: Colors.white,
            text_color: Sec_Color,
            pre_icon: "assets/twitter.png",
            isIcon: true,
            // pre_icon: "assets/facebook.png",
          ),
          SizedBox(
            height: 30,
          ),
          Custom_Button(
            onPressed: () {},
            text: 'Sign in with Twitter',
            btn_color: Colors.white,
            text_color: Sec_Color,
            pre_icon: "assets/twitter.png",
            isIcon: true,
            // pre_icon: "assets/twitter.png",
          ),
          SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Text(
            //   "Don't have an account?",
            //   style: GoogleFonts.ubuntu(
            //       fontSize: 18,
            //       fontWeight: FontWeight.normal,
            //       color: Sec_Color),
            // ),
            Ubuntu_Style_Text(text: "Dont have an account?", fontSize: 18, color: Sec_Color),            SizedBox(
              width: 2,
            ),
            Text(
              "Sign in",
              style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Sec_Color,
                  decoration: TextDecoration.underline),
            ),
          ])
        ],
      ),
    );
  }
}
