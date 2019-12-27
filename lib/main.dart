import 'package:first_demo/blink_animation.dart';
import 'package:first_demo/cuvered_shape.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      appBar: AppBar(
        title: Text("Boring Animaton"),
      ),
      body: ListView(
        children: <Widget>[
          itemAction(
              title: "Blink Animation",
              action: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlinkAnimation()));
              }),
          itemAction(
              title: "Cuvered shape",
              action: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CuveredShape()));
              })
        ],
      ),
    );
  }

  Widget itemAction({String title, Action action}) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 1),
                blurRadius: 1.0,
                spreadRadius: 1.0)
          ], color: Colors.white),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Text(title),
        ),
      ),
    );
  }
}

typedef Action = void Function();
