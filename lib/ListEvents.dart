import 'package:flutter/material.dart';
import 'package:udaan2020/ShowEvent.dart';
import 'package:udaan2020/models/EventDetail.dart';

class ListEvents extends StatefulWidget {
  List<EventDetail> events;
  ListEvents(this.events);
  @override
  _ListEventsState createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  List<String> eventNames = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.events.forEach((f) {
      eventNames.add(f.eventName);
    });
  }

  void next(index) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => ShowEvent(widget.events[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: eventNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(eventNames[index]),
              onTap: () => next(index),
            );
          }),
    );
  }
}
