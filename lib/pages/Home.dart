import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './ClubHomePage.dart';
import './TweersListPage.dart';
import './MyInfoPage.dart';
import './MyDrawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  final appBarTitles = ['俱乐部', '本分', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff3A90FF), fontSize: 9.0);
  final tabBarStyleNormal = new TextStyle(color:  const Color(0xff9C9EA7), fontSize: 9.0);
  Color themColor = const Color(0xFF3A90FF);
  int _tabIndex = 0;

  var tabImages;
  var _body;
  var pages;
  // var bottomNavBarItems;

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0,);
  }

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      new ClubHomePage(),
      new TweersListPage(),
      new MyInfoPage()
    ];
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_tab_normal_jlb.png'),
          getTabImage('images/ic_tab_selected_jlb.png')
        ],
        [
          getTabImage('images/ic_tab_normal_bf.png'),
          getTabImage('images/ic_tab_selected_bf.png')
        ],
        [
          getTabImage('images/ic_tab_normal_wd.png'),
          getTabImage('images/ic_tab_selected_wd.png')
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
      // new BottomNavigationBarItem(
      //   icon: getTabIcon(2),
      //   title: getTabTitle(2),
      // ),
      new BottomNavigationBarItem(
        icon: getTabIcon(2),
        title: getTabTitle(2),
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