
import 'package:minsaar/post_modal.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text("Feed"),
                      ),
                      ListTile(
                        title: Text("FEEDID"),
                        subtitle: Text("${post.feedid}"),
                      ),
                      ListTile(
                        title: Text("Data"),
                        subtitle: Text("${post.data}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}