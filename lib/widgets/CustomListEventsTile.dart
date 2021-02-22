import 'package:flutter/material.dart';
import 'package:udaan2020/Theme/Theme.dart';

class CustomListEventsTile extends StatefulWidget {
  String eventName;
  Function onTap;
  int index;
  String assetName;
  CustomListEventsTile({this.eventName,this.onTap,this.index,this.assetName});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateCustomListEventsTile();
  }
}

class _StateCustomListEventsTile extends State<CustomListEventsTile> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.assetName??""),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black12.withOpacity(0.8), BlendMode.darken),
          ),
          border: getBorder(widget.index),),
        child: Center(
          child: Text(
            widget.eventName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: whiteFontColor,
              fontFamily: "sad films",
            ),
          ),
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
