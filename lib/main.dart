import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/views/Home_Page.dart';
import 'package:insight/views/Saved_Articles.dart';
import 'package:insight/views/Search%20_Page.dart';
import 'package:insight/views/Settings_Page.dart';
import 'package:insight/views/auth/Sign_Up.dart';
import 'package:insight/views/auth/Sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  final List PageList = [
    const HomePage(),
    const SearchPage(),
    const SavedArticlePage(),
    const SettingsPage()
  ];
  bool isSignedIn = false;

  void ChangePage(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: ChangePage,
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Sec_Color,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Sec_Color,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark,
                    color: Sec_Color,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Sec_Color,
                  ),
                  label: '')
            ]),
        body: PageList[_index],
      ),
    );
  }
}

// PageList[_index]
