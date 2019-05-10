import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './HomePage.dart';
import './TweersListPage.dart';
import './MyInfoPage.dart';
import './MyDrawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  final appBarData = [
    {
      'title': '首页',
      'image': 'images/ic_tab_normal_jlb.svg'
    },
    {
      'title': '问答',
      'image': 'images/ic_tab_normal_bf.svg'
    },
    {
      'title': '我的',
      'image': 'images/ic_tab_normal_wd.svg'
    }
  ];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xffFFDC2E), fontSize: 9.0);
  final tabBarStyleNormal = new TextStyle(color:  const Color(0xff9C9EA7), fontSize: 9.0);
  Color themColor = const Color(0xFFFFDC2E);
  int _tabIndex = 0;

  var _body;
  var pages;

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      new HomePage(),
      new TweersListPage(),
      new MyInfoPage()
    ];
  }
  Widget getTabIcon(int curIdx) {
    var tabIcon;
    if (curIdx == _tabIndex) {
      tabIcon = new SvgPicture.asset(
        appBarData[curIdx]['image'],
        color: Color(0xffFFDC2E),
      );
    } else {
      tabIcon = new SvgPicture.asset(
        appBarData[curIdx]['image']
      );
    }
    return tabIcon;
  }
  TextStyle getTabTextStyle(int curIdx) {
    if (curIdx == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabBarStyleNormal;
  }
  Text getTabTitle(int curIdx) {
    return new Text(appBarData[curIdx]['title'], style: getTabTextStyle(curIdx),);
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
    ];
  }
  @override
  Widget build(BuildContext context) {
    _body = new IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return new Scaffold(
        appBar: new AppBar(
          title: Text(appBarData[_tabIndex]['title'], style: new TextStyle(color: Colors.white)),
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
      );
  }
}