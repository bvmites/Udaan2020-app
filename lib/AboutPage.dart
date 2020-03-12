import 'package:flutter/material.dart';
import 'package:udaan2020/Theme/Theme.dart';
import 'package:udaan2020/widgets/AuboutTab.dart';
import 'package:udaan2020/widgets/DeveloperTab.dart';

class AboutPage extends StatefulWidget {
  @override
  _StateAboutPage createState() => _StateAboutPage();
}

class _StateAboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                "About",
                style: TextStyle(color: whiteFontColor, letterSpacing: 2),
              ),
              backgroundColor: iosDarkThemeBlackBgColor,
              expandedHeight: 230.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/fulllogonormal.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  indicatorColor: lightBlue,
                  labelColor: whiteFontColor,
                  labelStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: "sad films",
                      letterSpacing: 2),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "Developers",
                    ),
                    Tab(text: "About"),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: [
            DeveloperTab(),
            AboutUs()
          ],
        ),
      ),
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: iosDarkThemeBlackBgColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
