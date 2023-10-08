import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Book_Mark_Card.dart';
import 'package:insight/providers/User_Provider.dart';
import 'package:insight/services/Post_Service.dart';

class BookMarkPage extends StatefulWidget {
  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  PostService postService = PostService();
  UserProvider userProvider = UserProvider();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot<Map<String, dynamic>>> data;
  @override
  void initState() {
    // TODO: implement initState
    data = firestore
        .collection('users')
        .doc(currentUser!
            .uid) // Assuming you have a 'users' collection with user documents
        .collection('bookmarks')
        .snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Book Mark ",
          style:
              TextStyle(fontFamily: "Nunito", fontSize: 22, color: Sec_Color),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!
                .uid) // Assuming you have a 'users' collection with user documents
            .collection('bookmarks')
            .snapshots(),
        builder: (context, snapshot) {
          print("snapshot" + snapshot.data.toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Center(child: Text('No articles found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                final bookmark = snapshot.data!.docs[index];
                final articleId = bookmark['articleId'] as String;
                return FutureBuilder(
                    future: postService
                        .getArticleDetails(articleId), // Implement this method
                    builder: (context, articleSnapshot) {
                      if (articleSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (articleSnapshot.hasError) {
                        return Text('Error: ${articleSnapshot.error}');
                      } else {
                        final articleData =
                            articleSnapshot.data as Map<String, dynamic>;
                        final user = userProvider.user;
                        return BookMarkCard(
                          name: user?.username ?? "Name",
                          profilepicture: 'assets/dp.jpg',
                          title: articleData['title'],
                        );
                      }
                    });
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
