import 'package:minsaar/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:minsaar/feed_input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minsaar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FeedInputPage(),
    );
  }
}