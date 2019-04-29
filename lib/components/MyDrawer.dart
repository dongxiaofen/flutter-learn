import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // final text = 'this is MyDrawer';
  // @override
  // Widget build(BuildContext context) {
  //   return new Padding(
  //     padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
  //     child: new Text(text),
  //   );
  // }
  static const double DRAWER_WIDTH = 300.0;
  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDHT = 16.0;
  var rightArrowIcon = new Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDHT,
    height: ARROW_ICON_WIDHT,
  );
  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  List menuIcon = [
    './images/ic_tab_selected_jlb.png',
    './images/ic_tab_selected_jlb.png',
    './images/ic_tab_selected_jlb.png',
    './images/ic_tab_selected_jlb.png'
  ];
  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: const BoxConstraints.expand(width: DRAWER_WIDTH),
      child: new Material(
        elevation: 16.0,
        child: new ListView.builder(
          itemCount: menuTitles.length * 2 + 1,
          itemBuilder: renderRow,
          padding: const EdgeInsets.all(0.0),
        ),
      ),
    );
  }
  Widget getImageIcon(path) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: new Image.asset(path, width: 28.0, height: 28.0),
    );
  }
  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      // render covet image
      var img = Image.asset(
        './images/cover_img.jpg',
        width: DRAWER_WIDTH,
        height: DRAWER_WIDTH,
      );
      return new Container(
        width: DRAWER_WIDTH,
        height: DRAWER_WIDTH,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child:  img,
      );
    }
    index -= 1;
    if (index.isOdd) {
      // 奇数,分割线
      return new Divider();
    }
    index = index ~/ 2;
    var listItemContent = new Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: new Row(
        children: <Widget>[
          getImageIcon(menuIcon[index]),
          new Expanded(
            child: new Text(
              menuTitles[index],
              style: new TextStyle(fontSize: 15.0),
            ),
          ),
          rightArrowIcon
        ],
      ),
    );
    return new InkWell(
      child: listItemContent,
      onTap: () {
        print(index);
      },
    );
  }
}