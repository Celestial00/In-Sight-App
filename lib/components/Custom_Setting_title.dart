import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class SettingsTile extends StatelessWidget {
  double Wdth;
  String title;
  SettingsTile({super.key, required this.Wdth, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: Wdth,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 2.0))),
      child: Text(title),
    );
  }
}
