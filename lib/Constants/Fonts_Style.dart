import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ubuntu_Style_Text extends StatelessWidget {
  final String text;
  double fontSize ;
  final Color color;

  Ubuntu_Style_Text({required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    );
  }
}


Widget Oxygen_Style_Text(String text, double fontSize, Color color, FontWeight fontWeight ) {
  return Text(
    text,
    style: GoogleFonts.oxygen(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}