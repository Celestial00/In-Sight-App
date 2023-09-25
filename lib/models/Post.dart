import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String uid;
  final String title;
  final String content;
  final Timestamp timestamp;

  Post({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  // Create a Post object from a map
  factory Post.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw ArgumentError("Map cannot be null");
    }
    return Post(
      id: map['id'] as String? ?? '',
      uid: map['uid'] as String? ?? '',
      title: map['title'] as String? ?? '',
      content: map['content'] as String? ?? '',
      timestamp: (map['timestamp'] )?.toDate() ?? Timestamp.now(),
    );
  }

  // Convert a Post object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'title': title,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
