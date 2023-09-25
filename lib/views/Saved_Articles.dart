import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Book_Mark_Card.dart';
import 'package:insight/services/Post_Service.dart';

class SavedArticlePage extends StatefulWidget {
  @override
  State<SavedArticlePage> createState() => _SavedArticlePageState();
}

class _SavedArticlePageState extends State<SavedArticlePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Your Library ",
          style:
              TextStyle(fontFamily: "Nunito", fontSize: 22, color: Sec_Color),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List>(
        future: postService.getUserArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No articles found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return BookMarkCard(
                  name: currentUser!.displayName!,
                  profilepicture: 'assets/dp.jpg',
                  title: article["title"],
                );
              },
            );
          }
        },
      ),
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      //     child: Column(
      //       children: [
      //         BookMarkCard(),
      //         BookMarkCard(),
      //         BookMarkCard(),
      //         BookMarkCard(),
      //         BookMarkCard(),
      //         BookMarkCard(),
      //         BookMarkCard(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
