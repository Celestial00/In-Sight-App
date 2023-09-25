import 'package:flutter/material.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Custom_Setting_title.dart';

class SettingsPage extends StatefulWidget {

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
        title: const Text(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Account",
                style: TextStyle(fontSize: 15, fontFamily: "Nunito"),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Join Premium",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Account Stats",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Account Settings",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Configure In-sight",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Theme",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Push",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Email notifications",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "About In-sight",
                style: TextStyle(fontSize: 15, fontFamily: "Nunito"),
              ),
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Help",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Terms of service",
            ),
            SettingsTile(
              Wdth: MediaQuery.of(context).size.width,
              title: "Privacy policy",
            ),
          ],
        ),
      ),
    );
  }
}
