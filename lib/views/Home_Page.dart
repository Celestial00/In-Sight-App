// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Tags_line.dart';
import '../components/Article_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double Xoffset = 0;
  double Yoffset = 0;
  double ScaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(Xoffset, Yoffset, 0)
        ..scale(ScaleFactor),
      child: ClipRRect(
        borderRadius: isDrawerOpen == true
            ? BorderRadius.circular(0)
            : BorderRadius.circular(50.0),
        child: Scaffold(
            backgroundColor: BackGround_Color,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: BackGround_Color,
                  leading: isDrawerOpen == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Xoffset = 230;
                              Yoffset = 130;
                              ScaleFactor = 0.6;
                              isDrawerOpen = false;
                            });
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ))
                      : IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              Xoffset = 0;
                              Yoffset = 0;
                              ScaleFactor = 1;
                              isDrawerOpen = true;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                  actions: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 18),
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
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 10, top: 10),
                        child: Text(
                          "In-Sight",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tags_line(),

                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      ArticleCard(),
                      // Expanded(
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      //     child: ListView(
                      //       children: [

                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
