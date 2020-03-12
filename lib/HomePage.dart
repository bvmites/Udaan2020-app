import 'package:flutter/material.dart';
import 'package:udaan2020/Theme/Theme.dart';
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
    String assetName;
    if (index.compareTo("Technical") == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Departments(event)));
    } else {
      switch (index) {
        case "Non-Technical":
          eventList = event.nonTech;
          assetName = icons[1];
          break;
        case "Cultural":
          eventList = event.cultural;
          assetName = icons[2];
          break;
        case "Flagship":
          eventList = event.star;
          assetName = icons[3];
          break;
        case "Workshop":
          eventList = event.workshop;
          assetName = icons[4];
          break;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ListEvents(eventList,assetName)));
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
                textAlign: TextAlign.center,
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
      backgroundColor: iosDarkThemeBlackBgColor,
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
        );
  }
}
