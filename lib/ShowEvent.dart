import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'models/Manager.dart';

class ShowEvent extends StatefulWidget {
  EventDetail event;
  ShowEvent(this.event);
  @override
  _ShowEventState createState() => _ShowEventState();
}

class _ShowEventState extends State<ShowEvent> {
  List<Manager> managers;
  List<Widget> contacts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    managers = widget.event.managers;
    buildchildren();
  }

  void buildchildren() {
    managers.forEach((f) {
      contacts.add(Column(
        children: <Widget>[Text(f.name), Text(f.phone)],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.event.eventName),
              Text(widget.event.tagline),
              Text("Entry Fees : " +
                  widget.event.entryFee.toString() +
                  "/" +
                  widget.event.teamSize.toString()),
              Divider(),
              Text("INSTRUCTIONS"),
              ListTile(
                title: Text("Round 1"),
                subtitle: Text(widget.event.rounds[0]),
              ),
              ListTile(
                title: Text("Round 2"),
                subtitle: Text(widget.event.rounds[1]),
              ),
              ListTile(
                title: Text("Round 3"),
                subtitle: Text(widget.event.rounds[2]),
              ),
              Text("Contact Us"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: contacts,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
