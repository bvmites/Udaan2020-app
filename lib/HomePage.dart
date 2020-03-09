import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'package:udaan2020/models/Manager.dart';
import 'ListEvents.dart';
import 'models/Event.dart';
import 'Departments.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Event event;
  List<EventDetail> eventList;
  List<Widget> children = [];
  List<String> events = [
    "Technical",
    "Non-Technical",
    "Cultural",
    "Flagship",
    "Workshop"
  ];
  final icons = [
    "assets/images/tech.jpeg",
    "assets/images/nonTech2.png",
    "assets/images/Mad2.png",
    "assets/images/StarEvent2.png",
    "assets/images/workshop2.png"
  ];
  void go(index) {
    if (index.compareTo("Technical") == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Departments(event)));
    } else {
      switch (index) {
        case "Non-Technical":
          eventList = event.nonTech;
          break;
        case "Cultural":
          eventList = event.cultural;
          break;
        case "Flagship":
          eventList = event.star;
          break;
        case "Workshop":
          eventList = event.workshop;
          break;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ListEvents(eventList)));
    }
  }

  void disp() async {
    String s =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    event = eventFromJson(s);
  }

  void buildChildren() {
    events.forEach((f) {
      children.add(
        GestureDetector(
          onTap: () {
            go(f);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icons[events.indexOf(f)]),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black12.withOpacity(0.7), BlendMode.darken),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Center(
                  child: Text(
                f,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: "sad films",
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 0),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disp();
    buildChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: children,
          ),
        ),
      ),
    )
//      ListView.builder(
//          itemCount: events.length,
//          itemBuilder: (context, index) {
//            return ListTile(
//              leading: Image.asset(icons[index]),
//              title: Text(events[index]),
//              onTap: () => go(index),
//            );
//          }),
        );
  }
}
