import 'package:flutter/material.dart';
import 'package:udaan2020/ShowEvent.dart';
import 'package:udaan2020/Theme/Theme.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'package:udaan2020/widgets/CustomListEventsTile.dart';

class ListEvents extends StatefulWidget {
  final List<EventDetail> events;
  String assetName;
  ListEvents(this.events,this.assetName);
  @override
  _ListEventsState createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  @override
  void next(index) {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) => ShowEvent(widget.events[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iosDarkThemeBlackBgColor,
      body: ListView.builder(
          itemCount: widget.events.length,
          itemBuilder: (context, index) {
            return CustomListEventsTile(eventName: widget.events[index].eventName,onTap: ()=>next(index),index: index,assetName: widget.assetName,);
          }),
    );
  }
}
