import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';

class SettingsTile extends StatelessWidget {
  double Wdth;
  SettingsTile({super.key, required this.Wdth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: Wdth,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black26,
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 2.0))),
      child: Text("somethings"),
    );
  }
}
