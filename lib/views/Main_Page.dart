import "package:flutter/material.dart";

import "../Constants/Color.dart";
import "Home_Page.dart";
import "Saved_Articles.dart";
import "Search _Page.dart";
import "Settings_Page.dart";

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {

int _index = 0;
  final List PageList = [HomePage(), SearchPage(), SavedArticlePage(),SettingsPage()];
  bool isSignedIn = false;

  void ChangePage(int index) {
    setState(() {
      _index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar:  BottomNavigationBar(
            onTap: ChangePage,
            currentIndex: _index,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color(0xff0c0f14),
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
                    Icons.bookmark_add,
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
    );
  }
}
