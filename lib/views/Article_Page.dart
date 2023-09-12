import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Sec_Color,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_add,
                color: Sec_Color,
              ))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "The Art and Science of Programming: Crafting Digital Magic",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                    height: 1.5,
                    wordSpacing: 3,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/dp.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "name",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Nunito",
                            ),
                          ))
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "2 hr",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Nunito",
                      ),
                    ))
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "Programming, often referred to as the art and science of instructing computers, has become an integral part of our modern world. From the software that powers our smartphones to the algorithms behind search engines, programming is the driving force that shapes our digital landscape. In this article, we'll delve into the world of programming, exploring its history, significance, and the essential skills needed to excel in this ever-evolving field.\The Evolution of Programming Programming has come a long way since its inception. In the early days of computing, programmers had to work directly with machine code, a series of binary instructions that computers could understand. This was a painstaking and error-prone process, as a single mistake could result in a system crash. As the field progressed, assembly languages and higher-level programming languages were developed to make the process more manageable and efficient.One significant milestone was the creation of FORTRAN (Formula Translation) in the 1950s, which was one of the first high-level programming languages. It allowed programmers to write code using more human-readable instructions, paving the way for greater accessibility and productivity in software development.",
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
