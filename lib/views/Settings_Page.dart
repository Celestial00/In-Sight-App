import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Custom_Setting_title.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double ScreenWdth = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(color: Sec_Color, fontFamily: "Nunito"),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito"),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Account",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Nunito"),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
