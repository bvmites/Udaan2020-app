import 'package:flutter/material.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'ListEvents.dart';
import 'models/Event.dart';

class Departments extends StatefulWidget {
  Event event;
  Departments(this.event);
  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  List<String> depts = ["CP / IT", "CE", "ME / PE", "EL", "EE"];
  List<EventDetail> eventList;
  void go(index) {
    switch (depts[index]) {
      case "CP / IT":
        eventList = widget.event.tech.cpit;
        break;
      case "CE":
        eventList = widget.event.tech.ce;
        break;
      case "ME / PE":
        eventList = widget.event.tech.mepr;
        break;
      case "EL":
        eventList = widget.event.tech.ecel;
        break;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ListEvents(eventList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: depts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(depts[index]),
              onTap: () => go(index),
            );
          }),
    );
  }
}
