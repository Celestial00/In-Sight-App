import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'Article_Button.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, top: 20, left: 20, right: 20),
      width: 500,
      height: 320,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Color(0xffe8e8e8), blurRadius: 5.0)],
          color: ArticleColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 16, left: 20, right: 14, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/dp.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  "2 hr ago",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 10,
                      fontWeight: FontWeight.w100),
                ))
          ],
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey[200],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            "Unleashing the Digital Symphony: Mastering the Art of Programming",
            style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Text(
            "In the ever-evolving landscape of technology, programming has emerged as the conductor's baton, orchestrating the intricate symphony of digital innovation. Just as a composer crafts harmonies to create breathtaking melodies, programmers weave lines of code to bring ideas to life. From shaping video games that transport us to fantastical worlds.",
            style: TextStyle(
                fontFamily: "Nunito",
                letterSpacing: 1,
                fontSize: 11,
                wordSpacing: 3),
          ),
        ),
        Article_Button()
      ]),
    );
  }
}
