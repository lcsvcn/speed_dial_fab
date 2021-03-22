import 'package:flutter/material.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      backgroundColor: Colors.blueGrey[700],
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
        secondaryBackgroundColor: Colors.grey[900],
        secondaryForegroundColor: Colors.grey[100],
        primaryBackgroundColor: Colors.grey[900],
        primaryForegroundColor: Colors.grey[100],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Test Speed Dial FAB Example",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
