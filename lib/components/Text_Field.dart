import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
// import 'package:insight/Constants/Fonts_Style.dart';

class Text_Field extends StatelessWidget {
  final String hint;
  TextEditingController controller = TextEditingController();

  Text_Field({required this.hint,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.ubuntu(
                fontSize: 16, fontWeight: FontWeight.normal, color: Sec_Color),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Sec_Color))),
      ),
    );
  }
}
