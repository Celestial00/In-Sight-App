// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Text_Field.dart';
import 'package:insight/components/custom_buttons.dart';


class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
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
              "Join InSight",
              style: GoogleFonts.ptSerif(
                  fontSize: 55,
                  fontWeight: FontWeight.normal,
                  color: Sec_Color),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text_Field(
            hint: "Full name",
          ),
          SizedBox(
            height: 20,
          ),
          Text_Field(hint: "Email"),
          SizedBox(
            height: 20,
          ),
          Text_Field(hint: "Password"),
          SizedBox(
            height: 20,
          ),
          Text_Field(hint: "Confirm Password"),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 30,
          ),
          Custom_Button(text: "Sign Up", onPressed: () {},isIcon: false,btn_color: Sec_Color,text_color: Colors.white,),
          SizedBox(
            height: 30,
          ),
          Custom_Button(onPressed: () {  }, text: 'Sign Up with Google',isIcon: true,text_color: Sec_Color,pre_icon: "assets/google.png",),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Already have an account?",
              style: GoogleFonts.roboto(
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  color: Sec_Color),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "Sign in",
              style: GoogleFonts.roboto(
                  fontSize: 19,
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
