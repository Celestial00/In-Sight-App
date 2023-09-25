
import 'package:flutter/material.dart';
import 'package:insight/models/User_Profile.dart';

class UserProvider with ChangeNotifier {
  User_Profile? _user;

  User_Profile? get user => _user;

  // Set the user data
  void setUser(User_Profile user) {
    _user = user;
    notifyListeners();
  }
  

  // Clear the user data (used during sign out)
  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
