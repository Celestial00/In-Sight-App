import 'package:flutter/material.dart';

class BookMarkCard extends StatelessWidget {
  const BookMarkCard({super.key});

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
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/dp.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 12),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "The Art and Science of Programming: Crafting Digital Magic",
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
