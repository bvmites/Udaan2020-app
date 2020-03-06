import 'package:flutter/material.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'ListEvents.dart';
import 'models/Event.dart';
import 'Departments.dart';

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
    "Star",
    "Workshop"
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
        case "Star":
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
              title: Text(events[index]),
              onTap: () => go(index),
            );
          }),
    );
  }
}
