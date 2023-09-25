import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/controllers/Post_Controller.dart';
import 'package:provider/provider.dart';

class ArticleEditor extends StatefulWidget {
  // ArticleEditor({required this.title, required this.content});

  @override
  State<ArticleEditor> createState() => _ArticleEditorState();
}

class _ArticleEditorState extends State<ArticleEditor> {
  bool isEmpty = true;
  String title = "";
  String content = "";
  void checkTitle(String title, String content) {
    if (title == "" && content == "" || content.length < 50) {
      setState(() {
        isEmpty = true;
      });
    } else {
      setState(() {
        isEmpty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostController>(context);
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
            child: InkWell(
              onTap: () {
                
                if (isEmpty == false)
                 {
                  postController
                      .addPost(title, content, "flutter")
                      .then((value) => Get.back());
                }
              },
              child: Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: isEmpty == true ? Colors.grey.shade500 : Sec_Color),
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
                  setState(() {
                    title = value;
                  });
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
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                  checkTitle(title, content);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
