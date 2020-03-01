import 'package:flutter/material.dart';
import 'package:minsaar/chart_page.dart';
import 'package:minsaar/feed_list.dart';
import 'package:minsaar/http_service.dart';

class FeedPage extends StatelessWidget {
  static const String routeName = '/feed';
  String apiKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: HttpService().getFeedList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FeedList>> snapshot) {
          if (snapshot.hasData) {
            List<FeedList> feeds = snapshot.data;
            return ListView(
              children: feeds
                  .map(
                    (FeedList feed) => ListTile(
                      title: Text(feed.name),
                      subtitle: Text("${feed.value}"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ChartPage(feed: feed)),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
