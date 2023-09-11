import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Book_Mark_Card.dart';

class SavedArticlePage extends StatefulWidget {
  const SavedArticlePage({super.key});

  @override
  State<SavedArticlePage> createState() => _SavedArticlePageState();
}

class _SavedArticlePageState extends State<SavedArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Your Library ",
          style:
              TextStyle(fontFamily: "Nunito", fontSize: 22, color: Sec_Color),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              BookMarkCard(),
              BookMarkCard(),
              BookMarkCard(),
              BookMarkCard(),
              BookMarkCard(),
              BookMarkCard(),
              BookMarkCard(),
            ],
          ),
        ),
      ),
    );
  }
}
