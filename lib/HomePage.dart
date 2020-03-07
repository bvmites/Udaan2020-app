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
  List<String> events = [
    "Technical",
    "Non-Technical",
    "Cultural",
    "Flagship",
    "Workshop"
  ];
  final icons = [
    "assets/images/tech.jpeg",
    "assets/images/nonTech.png",
    "assets/images/Mad.png",
    "assets/images/StarEvent.png",
    "assets/images/workshop.png"
  ];
  void go(index) {
    if (events[index].compareTo("Technical") == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Departments(event)));
    } else {
      switch (events[index]) {
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
//    var jsonString = json.decode(s);
//    print(jsonString['non-tech'][0]["managers"][0]);
//    Manager e =
//        Manager.fromJson(json.decode(jsonString["non-tech"][0]["managers"][0]));
//    print(jsonString['non-tech'][0]['id']);
    print("disp called");
    print("tech" + event.tech.ee[1].eventName);
    print("nontech" + event.nonTech.toString());
    print("falg" + event.star.toString());
    print("cult" + event.cultural.toString());
    print("wor" + event.workshop.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(icons[index]),
              title: Text(events[index]),
              onTap: () => go(index),
            );
          }),
    );
  }
}
