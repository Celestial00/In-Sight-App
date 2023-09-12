import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
// import 'package:insight/Constants/Fonts_Style.dart';

class Text_Field extends StatelessWidget {
  final String hint;

  const Text_Field({required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.ubuntu(
                fontSize: 16, fontWeight: FontWeight.normal, color: Sec_Color),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Sec_Color))),
      ),
    );
  }
}
