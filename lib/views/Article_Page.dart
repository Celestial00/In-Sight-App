// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/models/Post.dart';
import 'package:insight/services/Post_Service.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage(
      {required this.title,
      required this.content,
      required this.tag,
      required this.onBookmark,
      required this.isBookmarked,
      required this.id});

  String title;
  String content;
  String tag;
  VoidCallback onBookmark;
  bool isBookmarked;
  String id;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//make a firebase collection for bookmarks



  PostService postService = PostService();




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Sec_Color,
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.isBookmarked = !widget.isBookmarked;
                  if (widget.isBookmarked) {
                    // make add article to bookmarks colection here
                    postService.addBookmark(widget.id);
                  } else {
                    // Remove the article from bookmarks
                    postService.removeBookmark(widget.id);
                  }
                });
                widget.onBookmark();
              },
              icon: Icon(
                widget.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: widget.isBookmarked ? Colors.orange : Sec_Color,
              ))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                    height: 1.5,
                    wordSpacing: 3,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/dp.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "name",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'nunito',
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "2 hr",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'nunito',
                      ),
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(widget.content,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        letterSpacing: 1,
                        height: 1.5,
                        fontSize: 14,
                        wordSpacing: 3))),
          ],
        ),
      ),
    );
  }
}
