import 'package:flutter/material.dart';

import '../Constants/Color.dart';
import '../components/Book_Mark_Card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style:
              TextStyle(fontFamily: "Nunito", fontSize: 22, color: Sec_Color),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text("Result's"),
                ],
              ),
            ),
            BookMarkCard(),
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
    );
  }
}
