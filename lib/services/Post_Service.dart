import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PostService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> addPost(String title, String content, String tag) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final uid = user.uid;

        final postRef =
            _firestore.collection('posts').doc(); // Generate a unique post ID
        final post = {
          'id': postRef.id,
          'title': title,
          'content': content,
          'uid': uid,
          "tag": tag,
          'timestamp': FieldValue.serverTimestamp(),
        };

        await postRef.set(post);

        // Optionally, add a reference to the post in the user's subcollection
        final userPostRef = _firestore
            .collection('users')
            .doc(uid)
            .collection('userPosts')
            .doc(postRef.id);

        await userPostRef.set({'postId': postRef.id});
      }
    } catch (e) {
      print("Error adding post: $e");
    }
  }

  Future<List<DocumentSnapshot>> getUserArticles() async {
    try {
      if (currentUser == null) {
        return [];
      } else {
        final QuerySnapshot articlesQuery = await FirebaseFirestore.instance
            .collection('posts')
            .where('authorUid', isEqualTo: currentUser.uid)
            .get();
        return articlesQuery.docs;
      }
    } catch (e) {
      print('Error getting user articles: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMyArticles() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;

        final QuerySnapshot myArticlesSnapshot = await FirebaseFirestore
            .instance
            .collection('posts')
            .where('uid', isEqualTo: userId)
            .get();
        print(myArticlesSnapshot.docs);
        final List<Map<String, dynamic>> myArticles = myArticlesSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        return myArticles;
      } else {
        throw Exception('User not logged in');
      }
    } catch (e) {
      print('Error fetching my articles: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> getArticleDetails(String articleId) async {
    try {
      final DocumentSnapshot articleSnapshot = await FirebaseFirestore.instance
          .collection(
              'posts') // Assuming your articles are stored in a 'posts' collection
          .doc(articleId)
          .get();

      if (articleSnapshot.exists) {
        final Map<String, dynamic> articleData =
            articleSnapshot.data() as Map<String, dynamic>;
        return articleData;
      } else {
        throw Exception('Article not found');
      }
    } catch (e) {
      print('Error fetching article details: $e');
      throw e;
    }
  }

  Future<void> addBookmark(String articleId) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;

        // Reference to the user's bookmarks collection
        final userBookmarksCollection =
            _firestore.collection('users').doc(userId).collection('bookmarks');

        // Add the article ID to the user's bookmarks
        await userBookmarksCollection
            .doc(articleId)
            .set({'articleId': articleId});
      }
    } catch (e) {
      print("Error adding bookmark: $e");
    }
  }

  Future<void> removeBookmark(String articleId) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final userId = user.uid;

        // Reference to the user's bookmarks collection
        final userBookmarksCollection =
            _firestore.collection('users').doc(userId).collection('bookmarks');

        // Remove the article ID from the user's bookmarks
        await userBookmarksCollection.doc(articleId).delete();
      }
    } catch (e) {
      print("Error removing bookmark: $e");
    }
  }

  Future<void> updatePost(String postId, String title, String content) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final postRef = _firestore.collection('posts').doc(postId);
        final post = {
          'title': title,
          'content': content,
        };

        await postRef.update(post);
      }
    } catch (e) {
      print("Error updating post: $e");
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final postRef = _firestore.collection('posts').doc(postId);
        await postRef.delete();

        // Also, delete the reference in the user's subcollection
        final userUid = user.uid;
        final userPostRef = _firestore
            .collection('users')
            .doc(userUid)
            .collection('userPosts')
            .doc(postId);
        await userPostRef.delete();
      }
    } catch (e) {
      print("Error deleting post: $e");
    }
  }
}
