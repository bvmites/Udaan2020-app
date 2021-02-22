import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udaan2020/AboutPage.dart';
import 'package:udaan2020/SplashScreen/SplashScreen.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Udaan 2020',
      theme: ThemeData(
          fontFamily: "sad films",
          primarySwatch: Colors.blue,
          brightness: Brightness.dark),
//      home: AboutPage(),
      home: SplashScreen(),
    );
  }
}
