import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insight/Constants/Color.dart';
// import 'package:insight/components/Custom_Bottom_Sheet.dart';
import 'package:insight/components/Drawer.dart';
import 'package:insight/components/Tags_line.dart';
import 'package:insight/controllers/Post_Controller.dart';
import 'package:insight/controllers/User_Controller.dart';
import 'package:insight/providers/Post_Provider.dart';
import 'package:insight/providers/User_Provider.dart';
import 'package:insight/services/User_Profile_Service.dart';
import 'package:insight/views/Article_Editor.dart';
import 'package:insight/views/Article_Page.dart';
import 'package:provider/provider.dart';
import '../components/Article_Card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UserController userController = UserController();
  PostController postController = PostController();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserProfileService userProfileService = UserProfileService();
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

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final postController = Provider.of<PostController>(context);
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context);
    Object? posts;
    // final user = auth.currentUser;
    List<String> bookmarkedArticles = [];
    void toggleBookmark(String articleId) {
      setState(() {
        if (bookmarkedArticles.contains(articleId)) {
          // Unbookmark the article
          bookmarkedArticles.remove(articleId);
        } else {
          // Bookmark the article
          bookmarkedArticles.add(articleId);
        }
      });

      // Update Firestore to reflect the changes in bookmarkedArticles
      // Implement the Firestore update logic here
    }

    User user1 = FirebaseAuth.instance.currentUser!;

    // final postProvider = Provider.of<PostProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ArticleEditor());
        },
        backgroundColor: Sec_Color,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: custom_drawer(context),
      backgroundColor: BackGround_Color,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: BackGround_Color,
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            actions: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _paddingSize(context, 18),
                      vertical: _paddingSize(context, 18),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Sec_Color,
                    ),
                  ),
                  Positioned(
                    bottom: _paddingSize(context, 29),
                    right: _paddingSize(context, 22),
                    child: Container(
                      width: _paddingSize(context, 6.5),
                      height: _paddingSize(context, 6.5),
                      decoration: BoxDecoration(
                        color: btn_Color,
                        borderRadius: BorderRadius.circular(
                          _paddingSize(context, 50),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: _paddingSize(context, 25),
                    bottom: _paddingSize(context, 10),
                    top: _paddingSize(context, 10),
                  ),
                  child: Text(
                    "In-Sight",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: _textSize(context, 25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tags_line(),
                Container(
                  height: 700,
                  color: BackGround_Color,
                  child: FutureBuilder<void>(
                    future: postProvider.fetchPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return FutureBuilder<User?>(
                            future: postProvider.fetchUserDetails(),
                            builder: (context, userSnapshot) {
                              if (userSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (userSnapshot.hasError) {
                                return Center(
                                    child:
                                        Text('Error: ${userSnapshot.error}'));
                              } else {
                                final user = userProvider.user;

                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: postProvider.posts.length,
                                    itemBuilder: (context, index) {
                                      print(postProvider.posts.length);

                                      final post = postProvider.posts[index];
                                      //  userid = post.uid;
                                      return ArticleCard(
                                        title: post.title,
                                        content: post.content,
                                        timestamp: post.timestamp,
                                        name: user?.username ??
                                            user1.displayName!,
                                        profilepicture: "assets/dp.jpg",
                                        tag: "tag",
                                        onReadMoreTap: () {
                                          Get.to(() => ArticlePage(
                                                title: post.title,
                                                content: post.content,
                                                tag: "flutter",
                                                onBookmark: () {
                                                  toggleBookmark(post.id);
                                                },
                                                isBookmarked: bookmarkedArticles
                                                    .contains(post.id),
                                                id: post.id,
                                              ));
                                        },
                                      );
                                    });
                              }
                            });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
