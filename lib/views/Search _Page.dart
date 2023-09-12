// ignore: file_names
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: Sec_Color,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Sec_Color,
                    ),
                    hintText: "Search",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Sec_Color)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Sec_Color))),
                onChanged: (value) {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text("Result's"),
                ],
              ),
            ),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
            const BookMarkCard(),
          ],
        ),
      ),
    );
  }
}
