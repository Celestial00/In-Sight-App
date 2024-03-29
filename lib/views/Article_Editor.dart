import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class ArticleEditor extends StatefulWidget {
  const ArticleEditor({super.key});

  @override
  State<ArticleEditor> createState() => _ArticleEditorState();
}

class _ArticleEditorState extends State<ArticleEditor> {
  bool titleIsEmpty = true;

  void checkTitle(String value) {
    if (value == "") {
      setState(() {
        titleIsEmpty = true;
      });
    } else {
      setState(() {
        titleIsEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Sec_Color,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: titleIsEmpty == true
                        ? Colors.grey.shade500
                        : Sec_Color),
                child: const Center(
                  child: Text(
                    "Post",
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 30.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                cursorColor: Sec_Color,
                style: const TextStyle(fontSize: 30.0, fontFamily: "Nunito"),
                onChanged: (value) {
                  checkTitle(value);
                },
              ),
              TextFormField(
                minLines: 5,
                maxLines: 100,
                decoration: const InputDecoration(
                  hintText: "Content",
                  hintStyle: TextStyle(fontSize: 18.0, fontFamily: "Nunito"),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                cursorColor: Sec_Color,
                style: const TextStyle(fontSize: 18.0, fontFamily: "Nunito"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
