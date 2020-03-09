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
  List<String> depts = [
    "Cyber-Clan",
    "Road to Urbanization",
    "Pulleying the Future",
    "Wire-More to Wireless",
    "Lighting Ears Ahead"
  ];
  final icons = [
    "assets/images/Cpit2.png",
    "assets/images/Civil2.png",
    "assets/images/mech2.png",
    "assets/images/Ecel2.png",
    "assets/images/ee2.png"
  ];
  List<EventDetail> eventList;
  List<Widget> children = [];
  void go(index) {
    switch (index) {
      case "Cyber-Clan":
        eventList = widget.event.tech.cpit;
        break;
      case "Road to Urbanization":
        eventList = widget.event.tech.ce;
        break;
      case "Pulleying the Future":
        eventList = widget.event.tech.mepr;
        break;
      case "Wire-More to Wireless":
        eventList = widget.event.tech.ecel;
        break;
      case "Lighting Ears Ahead":
        eventList = widget.event.tech.ee;
        break;
    }
    print("list" + eventList.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ListEvents(eventList)));
  }

  void buildChildren() {
    depts.forEach((f) {
      children.add(
        GestureDetector(
          onTap: () {
            go(f);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icons[depts.indexOf(f)]),
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
                  fontSize: 45,
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
//          itemCount: depts.length,
//          itemBuilder: (context, index) {
//            return ListTile(
//              title: Text(depts[index]),
//              onTap: () => go(index),
//            );
//          }),
        );
  }
}
