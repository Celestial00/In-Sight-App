// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
/*
i want to build the profile screen same as the Medium app
*/
import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/Article_Card.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  List<String> items = <String>["Public", "Private", "Unlisted"];
  String dropdownValue = "Public";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 25, bottom: 10,right: 25),
        child: Column(
          children: [
            /*
     add the name of the user
     and the profile picture on the top of the screen
     */
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/dp.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(50)),
                ),
                SizedBox(
                  width: 20,
                ),
                Oxygen_Style_Text("John Sina", 40, Sec_Color, FontWeight.w500),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            /*
      add the the divider and the my stories that i have posted
            
            */
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Sec_Color)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  value: dropdownValue,
                  elevation: 5,
                  style: TextStyle(color: Sec_Color, fontSize: 16.5),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            /*
            all the blogs that i have posted
            */
            SizedBox(
              height: 20,
            ),
            ArticleCard(),
            
          ],
        ),
      ),
    );
  }
}
