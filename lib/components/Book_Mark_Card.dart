import 'package:flutter/material.dart';

class BookMarkCard extends StatelessWidget {
  const BookMarkCard(
      {Key? key,
      required this.name,
      required this.profilepicture,
      required this.title})
      : super(key: key);
  final String name;
  final String profilepicture;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: 450,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Color(0xffe8e8e8), blurRadius: 5.0)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(profilepicture),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 1,
                      height: 1.5,
                      wordSpacing: 3,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
