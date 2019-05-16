// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_nxj_c/widgets/common/bannerPageView.dart';

class HomeNav extends StatelessWidget {
  final List<dynamic> arr = [
    {'name': '电影', 'navKey': 'movie'},
    {'name': '娱乐', 'navKey': 'yule'},
    {'name': '周边', 'navKey': 'zhoubian'},
    {'name': '签到', 'navKey': 'qiandao'},
    {'name': '亲子乐园', 'navKey': 'children'},
    {'name': '超时便利', 'navKey': 'market'},
    {'name': '时尚家具', 'navKey': 'home'},
    {'name': '限时抢购', 'navKey': 'limit'},
  ];
  List<Widget> _buildColumn(context) {
    List<Widget> listWidget = [];
    List<Widget> listRow = [];
    int count = 4;
    for (var i = 0; i < arr.length; i += count) {
      listRow = [];
      for (var innerI = 0; innerI < count; innerI++) {
        listRow.add(
          Expanded(
            flex: 1,
            // child: Text('nav'),
            child: InkWell(
              onTap: (){ print(arr[innerI + i]['name']); },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      child: getNavIcon(innerI),
                    ),
                    Text(arr[innerI + i]['name'], style: TextStyle(fontWeight: FontWeight.normal),)
                  ],
                ),
              ),
            ),
          )
        );
      }
      listWidget.add(
        Row(
          children: listRow,
        )
      );
    }
    return listWidget;
  }
  Widget getNavIcon(int idx) {
    var icon;
    switch (idx) {
      case 0:
        icon = SvgPicture.asset('images/ic_time_normal_nh.svg');
        break;
      case 1:
        icon = SvgPicture.asset('images/ic_time_normal_nhz.svg');
        break;
      case 2:
        icon = SvgPicture.asset('images/ic_time_normal_yq.svg');
        break;
      case 3:
        icon = SvgPicture.asset('images/ic_time_normal_yqbbjr.svg');
        break;
      default:
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Column(
        children: _buildColumn(context),
      ),
    );
  }
}