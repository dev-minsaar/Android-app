import 'package:flutter/material.dart';
import 'package:minsaar/feed_page.dart';
import 'package:minsaar/storage.dart';

class FeedInputPage extends StatelessWidget {
  static const String routeName = '/feedInput';
  final apiTextField = TextEditingController();

  saveApiKey(context) {
    var data = apiTextField.text;
    new Storage().writeCounter(data.toString());
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FeedPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Api Key"),
      ),
      body: Align(
          alignment: Alignment.center,
          child: new Container(
            padding: EdgeInsets.all(15),
            child: new Column(children: <Widget>[
              new Flexible(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Api Key:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: apiTextField,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Api Key")),
                ),
              ),
              new Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: new SizedBox(
                    width: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      onPressed: () {
                        saveApiKey(context);
                      },
                      child: const Text('Save Api',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
