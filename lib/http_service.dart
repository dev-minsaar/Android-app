import 'dart:convert';
import 'package:http/http.dart';
import 'package:minsaar/feed_list.dart';
import 'package:minsaar/post_modal.dart';
import 'package:minsaar/storage.dart';

class HttpService {
  Future<List<Post>> getPosts(feed, start, end, interval) async {
    final apiKey = await Storage().readCounter();
    final String postsURL =
        "https://emoncms.org/feed/data.json?id=$feed&start=$start&end=$end&interval=$interval&apikey=$apiKey";
    Response res = await get(postsURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body
          .map(
            (dynamic item) => Post(
                timeStamp: new DateTime.fromMillisecondsSinceEpoch(item[0]),
                data: item[1] == null ? 0.00 : item[1].toDouble()),
          )
          .toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<FeedList>> getFeedList() async {
    final apiKey = await Storage().readCounter();
    final header = {"Authorization": apiKey};
    final jobsListAPIUrl = 'https://emoncms.org/feed/list.json';
    final response = await get(jobsListAPIUrl, headers: header);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new FeedList.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
