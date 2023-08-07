import 'package:flutter/material.dart';
import 'package:insight/views/Home_Page.dart';

import 'Drawer_Screen.dart';

class HolderPage extends StatelessWidget {
  const HolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [DrawerScreen(), HomePage()],
    );
  }
}
