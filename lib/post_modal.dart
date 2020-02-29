import 'package:flutter/foundation.dart';

class Post {
  final String feedid;
  final dynamic data;


  Post({
    @required this.feedid,
    @required this.data,

  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      feedid: json['feedid'] as String,
      data: json['data'] as dynamic,
      
    );
  }
}