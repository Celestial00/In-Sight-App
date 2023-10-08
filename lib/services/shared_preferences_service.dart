// import "dart:convert";

// import "package:shared_preferences/shared_preferences.dart";

// import "../models/User_Profile.dart";

// class Shared_Preferences_services {
//   Future<void> saveUserProfileToSharedPreferences(
//       User_Profile userProfile) async {
//     final prefs = await SharedPreferences.getInstance();
//     User_Profile user_profile = User_Profile(
//         bio: userProfile.bio,
//         email: userProfile.email,
//         profileImage: userProfile.profileImage,
//         uid: userProfile.uid,
//         username: userProfile.username);

//     await prefs.setString('userProfile', jsonEncode(user_profile));
//   }

//   Future<User_Profile?> getUserProfileFromSharedPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userProfileString = prefs.getString('userProfile');
//     if (userProfileString != null) {
//       final userProfileData = jsonDecode(userProfileString);
//       return User_Profile(
//         uid: userProfileData['uid'],
//         username: userProfileData['username'],
//         email: userProfileData['email'],
//         profileImage: userProfileData['profileImage'],
//         bio: userProfileData['bio'],
//       );
//     }
//     return null; // Return null if no user profile data is found
//   }
// }
