import 'package:flutter/material.dart';

class Tags_line extends StatefulWidget {
  

  @override
  State<Tags_line> createState() => _Tags_lineState();
}

class _Tags_lineState extends State<Tags_line> {
  List Tags = [
    "Programming",
    "Facts",
    "Education",
    "AI",
    "Internet of things",
    "Stories"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 40,
      child: ListView.builder(
          itemCount: Tags.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Text(
                    Tags[index],
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Nunito",
                        fontWeight: selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ));
          }),
    );
  }
}
