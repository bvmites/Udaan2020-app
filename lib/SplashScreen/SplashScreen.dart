import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udaan2020/AboutPage.dart';
import 'package:udaan2020/HomePage.dart';
import 'package:udaan2020/Theme/Theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateSplashScreen();
  }
}

class _StateSplashScreen extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controllerButton1;
  AnimationController controllerButton2;
  Animation<double> heartbeatAnimation;
  Animation<double> button1Animation;
  Animation<double> button2Animation;
  var timeout = const Duration(seconds: 6);
  var ms = const Duration(milliseconds: 1);
  bool completed = false;
  bool completedButton1 = false;
  bool completedButton2 = false;
  bool displayButton1 = false;
  bool displayButton2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controllerButton1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    controllerButton2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
  }

  animate() async {
//    Future.delayed(Duration(seconds: 2));
    if (completed == false) {
      heartbeatAnimation =
          Tween<double>(begin: 0, end: MediaQuery.of(context).size.width)
              .animate(controller);
      button1Animation = Tween<double>(
              begin: 0, end: (MediaQuery.of(context).size.width / 2) - 28)
          .animate(controllerButton1);
      button2Animation = Tween<double>(
              begin: 0, end: (MediaQuery.of(context).size.width / 2) - 28)
          .animate(controllerButton2);
      controller.forward().whenComplete(() async {
        setState(() {
          completed = true;
          displayButton1 = true;
          completedButton1 = true;
        });
        controllerButton1.forward();
        await Future.delayed(Duration(milliseconds: 350));
        setState(() {
          completedButton2 = true;
          displayButton2 = true;
        });
        controllerButton2.forward().whenComplete(() {});
      });
    }
  }

//  await Future.delayed(Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    animate();
    // TODO: implement build
    return AnimatedBuilder(
      animation: heartbeatAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: iosDarkThemeBlackBgColor,
          body: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  child: Image.asset(
                    "assets/images/fulllogonormal.png",
                    gaplessPlayback: true,
                    width: heartbeatAnimation.value,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
//                          (displayButton1)?
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                child: AnimatedBuilder(
                                  animation: button1Animation,
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Container(
                                        margin: EdgeInsets.only(left: 8),
                                        width: button1Animation.value,
                                        height: (button1Animation.value/3<60)?button1Animation.value/3:60.0,
                                        decoration: BoxDecoration(
                                            border: (completedButton1)
                                                ? getBorder(0)
                                                : null),
                                        child: FlatButton(
                                            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage())),
                                            child: Text(
                                          "About Us",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: whiteFontColor,
                                              fontSize: 18),
                                        )));
                                  },
                                ),
                              ),
                            ),
                          ),
//                              :Container(),
//                          (displayButton2)?
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                child: AnimatedBuilder(
                                  animation: button2Animation,
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Container(
                                        margin: EdgeInsets.only(left: 8),
                                        width: button2Animation.value,
                                        height: (button2Animation.value/3<60)?button2Animation.value/3:60.0,
                                        decoration: BoxDecoration(
                                            border: (completedButton2)
                                                ? getBorder(1)
                                                : null),
                                        child: FlatButton(
                                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                                            child: Text(
                                          "Explore",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: whiteFontColor,
                                              fontSize: 18),
                                        )));
                                  },
                                ),
                              ),
                            ),
                          )
//                              :Container(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Border getBorder(int i) {
    Border border;
    switch (i % 4) {
      case 0:
        border = Border(
          top: BorderSide(color: iosDarkThemeBlue, width: 4),
          left: BorderSide(color: lightBlue, width: 4),
          right: BorderSide(color: darkBrown, width: 4),
          bottom: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 1:
        border = Border(
          right: BorderSide(color: iosDarkThemeBlue, width: 4),
          top: BorderSide(color: lightBlue, width: 4),
          bottom: BorderSide(color: darkBrown, width: 4),
          left: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 2:
        border = Border(
          bottom: BorderSide(color: iosDarkThemeBlue, width: 4),
          right: BorderSide(color: lightBlue, width: 4),
          left: BorderSide(color: darkBrown, width: 4),
          top: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 3:
        border = Border(
          left: BorderSide(color: iosDarkThemeBlue, width: 4),
          bottom: BorderSide(color: lightBlue, width: 4),
          top: BorderSide(color: darkBrown, width: 4),
          right: BorderSide(color: lightBrown, width: 4),
        );
        break;
    }
    return border;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
