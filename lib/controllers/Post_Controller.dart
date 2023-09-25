import 'package:flutter/foundation.dart';
import 'package:insight/models/Post.dart';
import 'package:insight/services/Post_Service.dart';

class PostController with ChangeNotifier {
  final PostService _postService = PostService();
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  // Create a new post
  Future<void> addPost(String title, String content, String tag) async {
    await _postService.addPost(title, content, tag);
    // Notify listeners that the list of posts has changed
    // _loadPosts();
    notifyListeners();
  }

  // Load all posts
  // Future<void> loadPosts() async {
  //   try {
  //     // Call a service method to fetch posts
  //     final postsData = await getposts();

  //     // Convert the fetched data into a list of Post objects
  //     _posts = postsData as List<Post>;
  //     print("load data");
  //     // Notify listeners to update widgets that depend on this data
  //     notifyListeners();
  //   } catch (e) {
  //     print("Error loading posts: $e");
  //   }
  // }

  // Stream<List<Post>> getposts() {
  //   return _postService.getPosts(); // Delegate to the service to get the stream
  // }

  // Delete a post
  Future<void> deletePost(String postId) async {
    await _postService.deletePost(postId);
    // Notify listeners that the list of posts has changed
    // _loadPosts();
    notifyListeners();
  }
}
