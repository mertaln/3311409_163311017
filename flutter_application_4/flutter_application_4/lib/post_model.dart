import 'package:flutter/foundation.dart';

class Post {
  final int postId;
  final int id;
  final String name;
  final String body;
  final String email;
  Post({
    required this.postId,
    required this.id,
    required this.name,
    required this.body,
    required this.email,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      body: json['body'] as String,
      email: json['email'] as String,
    );
  }
}
