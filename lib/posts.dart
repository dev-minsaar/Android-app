import 'package:minsaar/http_service.dart';
import 'package:minsaar/post_detail.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (dynamic post) => ListTile(
                      title: Text("Feed"),
                      subtitle: Text("Details:"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetail(
                            post: post,
                          ),
                        ),
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