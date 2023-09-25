

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/User_Profile.dart';
import '../providers/User_Provider.dart';
import '../services/Auth_Service.dart';
import '../services/User_Profile_Service.dart';
import '../services/shared_preferences_service.dart';

class UserController {
  final AuthService _authService = AuthService();
  final UserProfileService _userProfileService = UserProfileService();
  final Shared_Preferences_services shared_preferences_services =
      Shared_Preferences_services();

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    final User? user =
        await _authService.signInWithEmailAndPassword(email, password);
    if (user != null) {
      // Fetch user profile and update the provider
      final User_Profile? userProfile =
          await _userProfileService.getUserProfileById(user.uid);
      if (userProfile != null) {
        Provider.of<UserProvider>(context, listen: false).setUser(userProfile);
      }
    }
    return user;
  }

  // Sign up with email and password
  Future<User?> registerWithEmailAndPassword(BuildContext context, String email,
      String password, String FullName) async {
    final User? user =
        await _authService.registerWithEmailAndPassword(email, password);
    if (user != null) {
      // Initialize user profile with default values
     final  User_Profile userProfile = User_Profile(
        uid: user.uid,
        username: FullName,
        email: user.email!,
        profileImage: "assets/dp.jpg",
        bio: '',
         
      );
       await shared_preferences_services
          .saveUserProfileToSharedPreferences(userProfile);
     
      // Create the user profile in Firestore
      await _userProfileService.updateUserProfile(userProfile);
      // Update the provider with the newly created profile
      Provider.of<UserProvider>(context, listen: false).setUser(userProfile);
    }
    return user;
  }

  // Sign out
  Future<void> signOut(BuildContext context) async {
    await _authService.signOut();
    // Clear user data from the provider
    Provider.of<UserProvider>(context, listen: false).clearUser();
  }
}
