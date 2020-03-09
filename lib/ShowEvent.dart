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
  List<Widget> contacts = [], rounds = [];
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
    int c = 1;
    widget.event.rounds.forEach((f) {
      rounds.add(ListTile(
        title: Text("Round " + c.toString()),
        subtitle: Text(f),
      ));
      c++;
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
              widget.event.tagline != null
                  ? Text(widget.event.tagline)
                  : Container(),
              Text("Entry Fees : " +
                  widget.event.entryFee.toString() +
                  "/" +
                  widget.event.teamSize.toString()),
              Divider(),
              Text("INSTRUCTIONS"),
              widget.event.rounds != null
                  ? Column(
                      children: rounds,
                    )
                  : Container(),
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
