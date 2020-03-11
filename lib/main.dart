import 'package:flutter/material.dart';
import 'package:udaan2020/AboutPage.dart';

import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "sad films",
          primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: HomePage(),
//      home: AboutPage(),
    );
  }
}
