import 'package:flutter/material.dart';
import 'package:minsaar/chart_page.dart';

class HomePagePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: ChartPage(),
    );
  }
}
