  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:insight/Constants/Color.dart';
  import '../views/Article_Page.dart';
  import 'Article_Button.dart';

  class ArticleCard extends StatefulWidget {
    ArticleCard({
      required this.title,
      required this.content,
      required this.timestamp,
      required this.name,
      required this.profilepicture,
      required this.tag,
      required this.onReadMoreTap,
    });

    String title;
    String content;
    Timestamp timestamp;
    String tag;
    String name;
    String profilepicture;
    final VoidCallback onReadMoreTap;

    @override
    State<ArticleCard> createState() => _ArticleCardState();
  }

  class _ArticleCardState extends State<ArticleCard> {
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
      return Container(
        margin: EdgeInsets.only(
          bottom: _paddingSize(context, 30),
          top: _paddingSize(context, 20),
          left: _paddingSize(context, 20),
          right: _paddingSize(context, 20),
        ),
        width: double.infinity,
        height: _paddingSize(context, 270),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffe8e8e8),
              blurRadius: _paddingSize(context, 5.0),
            )
          ],
          color: ArticleColor,
          borderRadius: BorderRadius.circular(_paddingSize(context, 20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: _paddingSize(context, 16),
                    left: _paddingSize(context, 20),
                    right: _paddingSize(context, 20),
                    bottom: _paddingSize(context, 10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: _paddingSize(context, 40),
                        height: _paddingSize(context, 40),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.profilepicture),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            _paddingSize(context, 50),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _paddingSize(context, 10),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: _textSize(context, 14),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: _paddingSize(context, 10)),
                  child: Text(
                    widget.timestamp.toDate().toString().substring(0, 16),
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: _textSize(context, 10),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: _paddingSize(context, 1),
              height: _paddingSize(context, 1),
              color: Colors.grey[200],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: _paddingSize(context, 10),
                vertical: _paddingSize(context, 10),
              ),
              child: Text(
                widget.title,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: _textSize(context, 22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: _paddingSize(context, 10),
                vertical: _paddingSize(context, 0),
              ),
              child: Text(
                widget.content,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Nunito",
                  letterSpacing: _paddingSize(context, 1),
                  fontSize: _textSize(context, 11),
                  wordSpacing: _paddingSize(context, 3),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.onReadMoreTap,
              child: Padding(
                padding: EdgeInsets.only(
                  left: _paddingSize(context, 10),
                  right: _paddingSize(context, 10),
                  top: _paddingSize(context, 25),
                  // bottom: _paddingSize(context, 10)
                ),
                child: Container(
                  width: double.infinity,
                  height: _paddingSize(context, 40),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.circular(_paddingSize(context, 10)),
                  ),
                  child: Center(
                    child: Text(
                      "Read More",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: _textSize(context, 16),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
