/*

i want to make the subscription page same as the medium app

*/
// Path: lib\views\Subscription_Page.dart
import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/Custom_Bottom_Sheet.dart';
import 'package:insight/components/Custom_Buttons.dart';
import 'package:insight/components/subscription_card.dart';
// import 'package:insight/components/Custom_Bottom_Modal_Sheet.dart';

class Subscription_Page extends StatefulWidget {
  const Subscription_Page({super.key});

  @override
  State<Subscription_Page> createState() => _Subscription_PageState();
}

class _Subscription_PageState extends State<Subscription_Page> {
  Bottom_Sheet bottom_sheet = Bottom_Sheet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,
         right: 20.0,
          top: 30),
        child: Custom_Button(text: "text", onPressed: (){
          
          bottom_sheet.Custom_Bottom_Sheet(context);
        })
      ),
    );
  }
}
