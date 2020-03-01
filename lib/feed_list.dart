import 'package:flutter/foundation.dart';

class FeedList {
  final String feedId;
  final String userId;
  final String name;
  final String tag;
  final String value;

  FeedList(
      {@required this.feedId,
      @required this.userId,
      @required this.name,
      @required this.tag,
      @required this.value});

  factory FeedList.fromJson(Map<String, dynamic> json) {
    return FeedList(
        feedId: json['id'],
        userId: json['userid'],
        name: json['name'],
        tag: json['tag'],
        value: json['value']);
  }
}
