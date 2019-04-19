import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/NewsListPage.dart';
import 'pages/TweersListPage.dart';
import 'pages/MyInfoPage.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/MyDrawer.dart';

void main() {
  runApp(new MyOSCClient());
}

class MyOSCClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyOSCClientState();
}

class MyOSCClientState extends State<MyOSCClient> {
  final appBarTitles = ['资讯', '动弹', '发现', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  final tabBarStyleNormal = new TextStyle(color:  const Color(0xff969696));
  Color themColor = const Color(0xFF63CA6C);
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;
  // var bottomNavBarItems;

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0,);
  }

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      new NewsListPage(),
      new TweersListPage(),
      new DiscoveryPage(),
      new MyInfoPage()
    ];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }
  Image getTabIcon(int curIdx) {
    if (curIdx == _tabIndex) {
      return tabImages[curIdx][1];
    }
    return tabImages[curIdx][0];
  }
  TextStyle getTabTextStyle(int curIdx) {
    if (curIdx == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabBarStyleNormal;
  }
  Text getTabTitle(int curIdx) {
    return new Text(appBarTitles[curIdx], style: getTabTextStyle(curIdx),);
  }
  List<BottomNavigationBarItem> getNavBarItems() {
    return [
      new BottomNavigationBarItem(
        icon: getTabIcon(0),
        title: getTabTitle(0),
      ),
      new BottomNavigationBarItem(
        icon: getTabIcon(1),
        title: getTabTitle(1),
      ),
      new BottomNavigationBarItem(
        icon: getTabIcon(2),
        title: getTabTitle(2),
      ),
      new BottomNavigationBarItem(
        icon: getTabIcon(3),
        title: getTabTitle(3),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    _body = new IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: themColor
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text(appBarTitles[_tabIndex], style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: getNavBarItems(),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: new MyDrawer(),
      ),
    );
  }
}