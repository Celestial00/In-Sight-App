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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackGround_Color,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: BackGround_Color,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
              actions: [
                Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
            )
          ],
        ));
  }
}
