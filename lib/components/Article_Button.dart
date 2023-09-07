import 'package:flutter/material.dart';

class Article_Button extends StatelessWidget {
  const Article_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Container(
          width: 430,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Read More",
              style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
