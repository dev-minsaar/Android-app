import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minsaar/feed_list.dart';
import 'package:minsaar/http_service.dart';
import 'package:minsaar/post_modal.dart';

class ChartPage extends StatefulWidget {
  final FeedList feed;

  ChartPage({this.feed});

  _ChartPageState createState() => _ChartPageState(feed);
}

class _ChartPageState extends State<ChartPage> {
  List<charts.Series<Post, DateTime>> _seriesLineDataDay;
  List<charts.Series<Post, DateTime>> _seriesLineDataMonth;
  List<charts.Series<Post, DateTime>> _seriesLineDataYear;
  FeedList feed;
  DateTime start;
  DateTime end;
  _ChartPageState(this.feed);

  _generateData() async {
    // get data from emomcms
    end = new DateTime.now();
    start = end.subtract(new Duration(days: 1));
    var linesalesdataDay = await HttpService().getPosts(feed.feedId,
        start.millisecondsSinceEpoch, end.millisecondsSinceEpoch, 120);
    start = end.subtract(new Duration(days: 30));
    var linesalesdataMonth = await HttpService().getPosts(feed.feedId,
        start.millisecondsSinceEpoch, end.millisecondsSinceEpoch, 3600);
    start = end.subtract(new Duration(days: 365));
    var linesalesdataYear = await HttpService().getPosts(feed.feedId,
        start.millisecondsSinceEpoch, end.millisecondsSinceEpoch, 43200);

    _seriesLineDataDay.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Day',
        data: linesalesdataDay,
        domainFn: (Post post, _) => post.timeStamp,
        measureFn: (Post post, _) => post.data,
      ),
    );
    _seriesLineDataMonth.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Month',
        data: linesalesdataMonth,
        domainFn: (Post post, _) => post.timeStamp,
        measureFn: (Post post, _) => post.data,
      ),
    );
    _seriesLineDataYear.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Year',
        data: linesalesdataYear,
        domainFn: (Post post, _) => post.timeStamp,
        measureFn: (Post post, _) => post.data,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesLineDataDay = List<charts.Series<Post, DateTime>>();
    _seriesLineDataMonth = List<charts.Series<Post, DateTime>>();
    _seriesLineDataYear = List<charts.Series<Post, DateTime>>();

    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(text: "Day"),
                Tab(text: "Month"),
                Tab(text: "Year"),
              ],
            ),
            title: Text('Histographic Power Graph'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: charts.TimeSeriesChart(_seriesLineDataDay,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Years',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Sales',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Departments',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: charts.TimeSeriesChart(_seriesLineDataMonth,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Time',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Power',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Power Consumption',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: charts.TimeSeriesChart(_seriesLineDataYear,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Time',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Power',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Power Consumption',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
