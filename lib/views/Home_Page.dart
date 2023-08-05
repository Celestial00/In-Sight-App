// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BackGround_Color,
        leading: Icon(
          Icons.menu,
          color: Sec_Color,
        ),
        actions: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Icon(
                  Icons.notifications,
                  color: Sec_Color,
                ),
              ),
              Positioned(
                bottom: 29,
                right: 22,
                child: Container(
                  width: 6.5,
                  height: 6.5,
                  decoration: BoxDecoration(
                      color: btn_Color,
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: BackGround_Color,
      body: Column(
        children: [],
      ),
    );
  }
}
