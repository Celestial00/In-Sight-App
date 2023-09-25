import 'package:flutter/material.dart';

class BookMarkCard extends StatelessWidget {
   BookMarkCard({
    required this.title,
    required this.name,
    required this.profilepicture,
    Key? key,
  }) : super(key: key);
   String title;
  String name;
  String profilepicture;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _paddingSize(context, 10),
        horizontal: _paddingSize(context, 20),
      ),
      child: Container(
        width: double.infinity,
        height: _paddingSize(context, 120),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_paddingSize(context, 10)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0xffe8e8e8), blurRadius: 5.0),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _paddingSize(context, 10),
            vertical: _paddingSize(context, 10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: _paddingSize(context, 40),
                    height: _paddingSize(context, 40),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/dp.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        _paddingSize(context, 50),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: _paddingSize(context, 10),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: _textSize(context, 12),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _paddingSize(context, 10),
                  vertical: _paddingSize(context, 10),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: _textSize(context, 13),
                    letterSpacing: _paddingSize(context, 1),
                    height: _textSize(context, 1.5),
                    wordSpacing: _paddingSize(context, 3),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
