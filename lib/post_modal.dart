import 'package:flutter/foundation.dart';

class Post {
  final DateTime timeStamp;
  final double data;


  Post({
    @required this.timeStamp,
    @required this.data,

  });

  assign(body) {
    return Post(
      timeStamp: body[0] as DateTime,
      data: body[1] as double,
    );
  }
}