import 'package:flutter/material.dart';
import 'speed_dial_fab_widget.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDialFabWidget(
        secondaryIconsList: [
          Icons.content_copy,
          Icons.content_paste,
          Icons.content_cut,
        ],
        secondaryIconsText: [
          "copy",
          "paste",
          "cut",
        ],
        secondaryIconsOnPress: [
          () => {},
          () => {},
          () => {},
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Test Speed Dial FAB"),
        ),
      ),
    );
  }
}
