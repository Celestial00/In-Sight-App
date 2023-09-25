

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/controllers/Post_Controller.dart';
import 'package:insight/firebase_options.dart';
import 'package:insight/providers/Post_Provider.dart';
import 'package:insight/providers/User_Provider.dart';
import 'package:insight/services/Post_Service.dart';
import 'package:insight/views/Home_Page.dart';
import 'package:insight/views/Saved_Articles.dart';
import 'package:insight/views/Search%20_Page.dart';
import 'package:insight/views/Settings_Page.dart';
import 'package:insight/views/auth/Sign_Up.dart';
import 'package:insight/views/auth/Sign_in.dart';
import 'package:provider/provider.dart';

import 'views/Main_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PostProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => PostController())
    
    // Add more providers as needed
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  final List PageList = [HomePage(), SearchPage(), SettingsPage(),SavedArticlePage()];
  bool isSignedIn = false;

  void ChangePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Sign_In(),

    );
  }
}
