import 'dart:convert';
import 'package:http/http.dart';
import 'post_modal.dart';
class HttpService {
  final String postsURL = "https://emoncms.org/feed/data.json?ids=406874&start=1581600600000&end=1582206300000&interval=900&skipmissing=0&limitinterval=0&apikey=d29f08b76ef8ddbfc52656e4b71e3c67";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}