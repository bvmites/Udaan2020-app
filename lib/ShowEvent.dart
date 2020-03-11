import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaan2020/Theme/Theme.dart';
import 'package:udaan2020/models/EventDetail.dart';
import 'package:url_launcher/url_launcher.dart';

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
  }

  void buildchildren() {
    contacts = [];
    rounds = [];
    managers.forEach((f) {
      contacts.add(Container(
        width: (MediaQuery.of(context).size.width / 2),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(f.name,
                  style: TextStyle(color: lightFontColor, fontSize: 16)),
              GestureDetector(
                onTap: ()async{
                  String url = "tel:"+f.phone;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print('Could not launch $url');
                  }
                },
                child: Text(f.phone,
                    style: TextStyle(
                        color: iosDarkThemeBlue,
                        fontSize: 16,
                        decoration: TextDecoration.underline)),
              )
            ],
          ),
        ),
      ));
    });
    int c = 1;
    widget.event.rounds.forEach((f) {
      rounds.add(
          Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: getBorder(c-1)
            ),
            child: ListTile(
        title: Text(
            "Round " + c.toString(),
            style: TextStyle(
                letterSpacing: 2,
                color: whiteFontColor,
                fontWeight: FontWeight.w500,
                fontSize: 18),
        ),
        subtitle: Text(f,
              style: TextStyle(
                  letterSpacing: 2, color: lightFontColor, fontSize: 16)),
      ),
          ));
      c++;
    });
  }

  @override
  Widget build(BuildContext context) {
    buildchildren();
    return Scaffold(
      backgroundColor: iosDarkThemeBlackBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                height: 76,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            widget.event.eventName,
                            style: TextStyle(fontSize: 24, letterSpacing: 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(
              color: darkBrown,
            ),
            widget.event.tagline != null
                ? Container(
                    margin: EdgeInsets.all(8.0),
                    child: Text(
                      widget.event.tagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : Container(),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
//                border: getBorder(),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    width: double.infinity,
                    decoration:BoxDecoration(
                      border: Border(bottom: BorderSide(color: darkBrown))
                    ),
                    child: Text(
                      "INSTRUCTIONS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 2,
                          color: iosDarkThemeBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  widget.event.rounds != null
                      ? Column(
                          children: rounds,
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text(
                  "Entry Fees : " +
                      widget.event.entryFee.toString() +
                      "/" +
                      widget.event.teamSize.toString(),
                  style: TextStyle(
                      letterSpacing: 2, color: whiteFontColor, fontSize: 16),
                  textAlign: TextAlign.start,
                )),
            Container(
                margin: EdgeInsets.all(8.0),
                child: Text("Contact Us",
                    style: TextStyle(
                        color: iosDarkThemeBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 2))),
            Container(
              margin: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: contacts),
              ),
            )
          ],
        ),
      ),
    );
  }

  Border getBorder(int i){
    Border border;
    switch(i%4){
      case 0:
        border = Border(
          top: BorderSide(color: iosDarkThemeBlue,width: 4),
          left: BorderSide(color: lightBlue,width: 4),
          right: BorderSide(color: darkBrown,width: 4),
          bottom: BorderSide(color: lightBrown,width: 4),);
        break;
      case 1:
        border = Border(
          right: BorderSide(color: iosDarkThemeBlue,width: 4),
          top: BorderSide(color: lightBlue,width: 4),
          bottom: BorderSide(color: darkBrown,width: 4),
          left: BorderSide(color: lightBrown,width: 4),);
        break;
      case 2:
        border = Border(
          bottom: BorderSide(color: iosDarkThemeBlue,width: 4),
          right: BorderSide(color: lightBlue,width: 4),
          left: BorderSide(color: darkBrown,width: 4),
          top: BorderSide(color: lightBrown,width: 4),);
        break;
      case 3:
        border = Border(
          left: BorderSide(color: iosDarkThemeBlue,width: 4),
          bottom: BorderSide(color: lightBlue,width: 4),
          top: BorderSide(color: darkBrown,width: 4),
          right: BorderSide(color: lightBrown,width: 4),);
        break;
    }
    return border;
  }
}
