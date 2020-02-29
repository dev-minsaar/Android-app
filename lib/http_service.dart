import 'dart:convert';
import 'package:http/http.dart';
import 'package:minsaar/post_modal.dart';

class HttpService {
  final String postsURL = "https://emoncms.org/feed/data.json?id=407255&start=1582309800000&end=1583001000000&interval=86400&skipmissing=0&limitinterval=1&apikey=d29f08b76ef8ddbfc52656e4b71e3c67";

   Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body
          .map(
            (dynamic item) => Post(data: item[0] == null? 0.00: item[0] as double,timeStamp:  item[1] == null ? 0.00 : item[1] as double),
          )
          .toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}