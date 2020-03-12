import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udaan2020/Theme/Theme.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Text(
              "About BVM",
              textAlign: TextAlign.center,
              style: TextStyle(color: iosDarkThemeBlue, fontSize: 35),
            ),
            SizedBox(
              height: 8,
              width: double.maxFinite,
              child: Divider(
                color: darkBrown,
                thickness: 3,
              ),
            ),
            Text(
              'We birla vishvakarma Mahavidyalaya(BVM) family take the pride of being the first engineering college in the state of Gujarat, founded in 1948 and inaugurated by last Viceroy of India "Lord Mountbatten".  ',
              style: TextStyle(fontSize: 16, color: whiteFontColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "About Udaan",
              textAlign: TextAlign.center,
              style: TextStyle(color: iosDarkThemeBlue, fontSize: 35),
            ),
            SizedBox(
              height: 8,
              width: double.maxFinite,
              child: Divider(
                color: darkBrown,
                thickness: 3,
              ),
            ),
            Text(
              'UDAAN is not just an annual function but a celebration of what the students here are and about their aspirations and dreams. As the name defines it is joint effort by each one to help provide the flight and wings to the bright ideas of young minds.',
              style: TextStyle(fontSize: 16, color: whiteFontColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Follow Us",
              textAlign: TextAlign.center,
              style: TextStyle(color: iosDarkThemeBlue, fontSize: 35),
            ),
            SizedBox(
              height: 8,
              width: double.maxFinite,
              child: Divider(
                color: darkBrown,
                thickness: 3,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/instagram.svg",
                    color: whiteFontColor,
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/images/facebook.svg",
                    color: whiteFontColor,
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/images/youtube.svg",
                    color: whiteFontColor,
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/images/dribbble.svg",
                    color: whiteFontColor,
                    height: 40,
                    width: 40,
                  ),
                  SvgPicture.asset(
                    "assets/images/sharing.svg",
                    color: whiteFontColor,
                    height: 40,
                    width: 40,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Reach Us",
              textAlign: TextAlign.center,
              style: TextStyle(color: iosDarkThemeBlue, fontSize: 35),
            ),
            SizedBox(
              height: 8,
              width: double.maxFinite,
              child: Divider(
                color: darkBrown,
                thickness: 3,
              ),
            ),
            Text(
              'BVM Engineering College, Opp. Shastri Maidan, Mota Bazzar, Vallabh Vidyanagar, Anand, Gujarat - 388120, India',
              style: TextStyle(fontSize: 16, color: whiteFontColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      height: 300,
      width: double.infinity,
      //color: Colors.green,
      color: iosDarkThemeBlackBgColor,
    );
  }
}
