// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Tags_line.dart';
import 'package:insight/views/Article_Editor.dart';
import '../components/Article_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _ScaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(

              MaterialPageRoute(builder: (context) => ArticleEditor())

            );
          },
          backgroundColor: Sec_Color,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
            backgroundColor: Sec_Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 40),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/dp.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      "Name",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      "@User_Name",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 20),
                        child: Column(
                          children: [
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text("Followers",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                    color: Colors.white))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 20),
                        child: Column(
                          children: [
                            Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text("Following",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                    color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Add Articles",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.article,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Your Articles",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.subscriptions,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Subscriptions",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
        backgroundColor: BackGround_Color,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: BackGround_Color,
              leading: IconButton(
                  onPressed: () {
                    _ScaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
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
                ],
              ),
            ),
          ],
        ));
  }
}
