import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:insight/models/User.dart';
import 'package:insight/models/User_Profile.dart';
// import '/models/user.dart';

class UserProfileService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create or update a user profile
  Future<void> updateUserProfile(User_Profile userProfile) async {
    try {
      await _firestore.collection('users').doc(userProfile.uid).set({
        'username': userProfile.username,
        'email': userProfile.email,
        'profileImage': userProfile.profileImage,
        'bio': userProfile.bio,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Get user profile by user ID
  Future<User_Profile?> getUserProfileById(String uid) async {
    try {
      final DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return User_Profile(
          uid: uid,
          username: data['username'],
          email: data['email'],
          profileImage: data['profileImage'],
          bio: data['bio'] ?? " ",
        );
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
