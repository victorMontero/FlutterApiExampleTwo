import 'package:api_example_two/widgets/news_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
            title: TextStyle(fontSize: 30, color: Colors.white),
            subtitle: TextStyle(fontSize: 20, color: Colors.white),
            body1: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NewsWidget(),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.7],
                colors: [
              Color(0xFFF12711),
              Color(0xFFf5af19),
            ])),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
