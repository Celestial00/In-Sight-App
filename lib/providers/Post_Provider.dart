import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insight/models/Post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Add a new post
  void addPost(Post post, content) {
    _posts.add(post);
    print("Posts: $_posts");
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    try {
      final QuerySnapshot postSnapshot =
          await _firestore.collection('posts').get();

      final List<Post> loadedPosts = [];

      for (final DocumentSnapshot postDoc in postSnapshot.docs) {
        final postData = postDoc.data() as Map<String, dynamic>;

      

        final post = Post(
          id: postDoc.id,
          uid: postData['uid'],
          title: postData['title'] ?? '',
          content: postData['content'] ?? "", timestamp: postData['timestamp'],
          // Add other fields as needed
        );

        loadedPosts.add(post);
      }
      

      _posts = loadedPosts;
      notifyListeners();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  // Remove a post
  void removePost(Post post) {
    _posts.remove(post);
    notifyListeners();
  }

  Future<User?> fetchUserDetails() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (e) {
      print('Error fetching user details: $e');
      throw e;
    }
  }
}




  // Add a method to fetch user details
 

  // ...

