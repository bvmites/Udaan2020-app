import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udaan2020/Theme/Theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateDeveloperTab();
  }
}

class _StateDeveloperTab extends State<DeveloperTab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: iosDarkThemeBlackBgColor,
      child: ListView(
        children: <Widget>[
          ListItem(
            technology: "FLUTTER",
            name: "Ahmed Gagan",
            mobileNumber: "8980052099",
            gitHubLink: "https://github.com/Ahmedgagan",
            position: "Flutter Developer",
            listIndex: 0,
            email: "ahmedgagan3@gmail.com",
          ),
          ListItem(
            technology: "FLUTTER",
            name: "Ahmed Gagan",
            mobileNumber: "8980052099",
            gitHubLink: "https://github.com/Ahmedgagan",
            position: "Flutter Developer",
            listIndex: 1,
            email: "ahmedgagan3@gmail.com",
          ),
          ListItem(
            technology: "WEB",
            name: "Mitesh Chaudhary",
            mobileNumber: "8980052099",
            gitHubLink: "https://github.com/Ahmedgagan",
            position: "VUE JS",
            listIndex: 2,
            email: "mitesh@gmail.com",
          ),
          ListItem(
            technology: "WEB",
            name: "Ahmed Gagan",
            mobileNumber: "8980052099",
            gitHubLink: "https://github.com/Ahmedgagan",
            position: "VUE JS",
            listIndex: 3,
            email: "ahmedgagan3@gmail.com",
          ),
          ListItem(
            technology: "FLUTTER",
            name: "Ahmed Gagan",
            mobileNumber: "8980052099",
            gitHubLink: "https://github.com/Ahmedgagan",
            position: "Flutter Developer",
            listIndex: 4,
            email: "ahmedgagan3@gmail.com",
          ),
        ],
      ),
    );
  }
}
class ListItem extends StatelessWidget {
  String technology;
  String name;
  String mobileNumber;
  String email;
  String gitHubLink;
  String position;
  int listIndex;

  ListItem(
      {this.technology,
      this.name,
      this.mobileNumber,
      this.gitHubLink,
      this.position,
      this.listIndex,
      this.email});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          border: getBorder(listIndex), color: Color.fromRGBO(58, 58, 58, 1)),
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: SvgPicture.asset(
                    (technology=="FLUTTER")?"assets/images/flutterLogo.svg":"assets/images/webDeveloper.svg",
                      color: whiteFontColor,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: double.infinity,
                                child: Text(
                                  name,
                                  style: TextStyle(letterSpacing: 2, fontSize: 20,),
                                  textAlign: TextAlign.right,
                                )),
                            Container(
                                width: double.infinity,
                                child: Text(
                                  position,
                                  style:
                                      TextStyle(letterSpacing: 2, fontSize: 14),
                                  textAlign: TextAlign.right,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap:() async{
                                String url = "tel:"+mobileNumber;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.all(8),
                                  child: Center(
                                      child: Icon(
                                Icons.phone,
                                size: 30,
                              ))),
                            ),
                            GestureDetector(
                              onTap:() async{
                                String url = "mailto:"+email+"?subject=Developer%20Invitation%20from%20udaan2020%20Application&body=Hey%20I%20have%20a%20developing%20related%20work%20for%20you";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                  child: Center(
                                      child: Icon(
                                Icons.email,
                                size: 30,
                              ))),
                            ),
                            GestureDetector(
                              onTap:() async{
                                String url = gitHubLink;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              },
                              child: Container(
                                  margin: EdgeInsets.all(8),
                                  child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/github_logo.svg",
                                        color: whiteFontColor,
                                        height: 25,
                                        width: 25,
                                      ),)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Border getBorder(int i) {
    Border border;
    switch (i % 4) {
      case 0:
        border = Border(
          top: BorderSide(color: iosDarkThemeBlue, width: 4),
          left: BorderSide(color: lightBlue, width: 4),
          right: BorderSide(color: darkBrown, width: 4),
          bottom: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 1:
        border = Border(
          right: BorderSide(color: iosDarkThemeBlue, width: 4),
          top: BorderSide(color: lightBlue, width: 4),
          bottom: BorderSide(color: darkBrown, width: 4),
          left: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 2:
        border = Border(
          bottom: BorderSide(color: iosDarkThemeBlue, width: 4),
          right: BorderSide(color: lightBlue, width: 4),
          left: BorderSide(color: darkBrown, width: 4),
          top: BorderSide(color: lightBrown, width: 4),
        );
        break;
      case 3:
        border = Border(
          left: BorderSide(color: iosDarkThemeBlue, width: 4),
          bottom: BorderSide(color: lightBlue, width: 4),
          top: BorderSide(color: darkBrown, width: 4),
          right: BorderSide(color: lightBrown, width: 4),
        );
        break;
    }
    return border;
  }
}
