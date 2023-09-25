import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Custom_Bottom_Sheet.dart';
import 'package:insight/services/Auth_Service.dart';
import 'package:insight/views/Article_Editor.dart';
import 'package:insight/views/Saved_Articles.dart';
import 'package:insight/views/auth/Sign_In.dart';
import 'package:provider/provider.dart';
import '../providers/User_Provider.dart';

Widget custom_drawer(BuildContext context) {
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

  AuthService authService = AuthService();
  final userProvider = Provider.of<UserProvider>(context);
  User user1 = FirebaseAuth.instance.currentUser!;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print("User is currently signed out!");
    } else {
      print("User is signed in!");
      print(user.uid);
    }
  });
  final user = userProvider.user;

  return Drawer(
    backgroundColor: Sec_Color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: _paddingSize(context, 60),
            left: _paddingSize(context, 40),
          ),
          child: Container(
            width: _paddingSize(context, 60),
            height: _paddingSize(context, 60),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dp.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                _paddingSize(context, 50),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: _paddingSize(context, 30),
          ),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              user == null ? user1.displayName! : user.username,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: _textSize(context, 18),
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              user == null
                  ? "@${user1.displayName}".toLowerCase()
                  : "@${user.username}".toLowerCase(),
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: _textSize(context, 16),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: _paddingSize(context, 20),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: _paddingSize(context, 40),
                  top: _paddingSize(context, 20),
                ),
                child: Column(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: _textSize(context, 16),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: _textSize(context, 12),
                        fontFamily: 'Nunito',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _paddingSize(context, 40),
                  top: _paddingSize(context, 20),
                ),
                child: Column(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: _textSize(context, 16),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontSize: _textSize(context, 12),
                        fontFamily: 'Nunito',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: _paddingSize(context, 30),
          ),
          child: ListTile(
            onTap: () => Get.to(() => ArticleEditor()),
            leading: Icon(
              Icons.add,
              color: Colors.white,
            ),
            title: Text(
              "Add Articles",
              style: TextStyle(
                fontSize: _textSize(context, 16),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: _paddingSize(context, 30),
          ),
          child: ListTile(
            onTap: ()=> Get.to(() => SavedArticlePage()),
            leading: Icon(
              Icons.article,
              color: Colors.white,
            ),
            title: Text(
              "Your Articles",
              style: TextStyle(
                fontSize: _textSize(context, 16),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: _paddingSize(context, 30),
          ),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Custom_Subscrption_Page(),
              ));
            },
            leading: Icon(
              Icons.subscriptions,
              color: Colors.white,
            ),
            title: Text(
              "Subscriptions",
              style: TextStyle(
                fontSize: _textSize(context, 16),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: _paddingSize(context, 30),
          ),
          child: ListTile(
            onTap: () =>
                authService.signOut().then((value) => Get.to(() => Sign_In())),
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: _textSize(context, 16),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
