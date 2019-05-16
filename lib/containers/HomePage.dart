import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_nxj_c/store/client_store.dart';
// import 'package:fluro/fluro.dart';
// import '../routers/application.dart';
import 'package:flutter_nxj_c/api/client.dart';
import 'package:flutter_nxj_c/widgets/homePage/Banner.dart';
import 'package:flutter_nxj_c/widgets/homePage/HomeNav.dart';
import 'package:flutter_nxj_c/widgets/homePage/CardItem.dart';


class HomePage extends StatefulWidget {
  @override
  State createState() {
    return new HomePageState();
  }
}
class HomePageState extends State<HomePage> {
  // final ClientStore clientStore = ClientStore();
  bool isLoading = false;
  bool hasMore = true;
  int pageIndex = 1;
  int pageSize = 10;
  List items = new List();
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    getMoreData(0);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        getMoreData(1);
        print('END');
      }
    });
  }
  Future getMoreData(int index) async {
    if (!isLoading && hasMore) {
      pageIndex += index;
      if (this.mounted) {
        setState(() {
          isLoading = true;
        });
      }
      var response = await getHomePageList({
        'page': pageSize,
        'index': pageIndex
      });
      if (this.mounted) {
        setState(() {
          hasMore = (pageIndex * pageSize < response['totalElements']);
          isLoading = false;
          items.addAll(response['content']);
        });
      }
    }
  }
  Future handleRefresh() async {
    print('thsi is refresh');
    pageIndex = 1;
    var response = await getHomePageList({
      'page': pageSize,
      'index': 1
    });
    hasMore = (pageIndex * pageSize < response['totalElements']);
    if (this.mounted) {
      setState(() {
        items.clear();
        items.addAll(response['content']);
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // banner
            return Column(
              children: <Widget>[
                HomeBanner(),
                HomeNav()
              ],
            );
          }
          if (index == items.length) {
            // last
            return _renderEndFooter();
          }
          // render item
          return Container(
            child: CardItem(),
          );
        },
        controller: _scrollController,
      ),
      onRefresh: handleRefresh,
    );

    // return new Scaffold(
    //   body: new Center(
    //     child: new Text('俱乐部页面---------'),
    //   ),
    //   floatingActionButton: new FloatingActionButton(
    //     backgroundColor: const Color(0xFF3A90FF),
    //     child: new Text('跳转', style: new TextStyle(color: Colors.white),),
    //     onPressed: () {
    //       const testData = 'this is test data';
    //       Application.router.navigateTo(context, '/income?clubId=455&testData=$testData', transition: TransitionType.inFromRight);
    //       // Application.router.navigateTo(context, '/income', transition: TransitionType.fadeIn);
    //       // Application.router.navigateTo(context, '/income', transition: TransitionType.native);
    //     },
    //   ),
    // );
  }
  Widget _renderEndFooter() {
    if (hasMore) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Opacity(
                opacity: isLoading ? 1.0 : 0.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(const Color(0xffFFDC2E)),
                ),
              ),
              SizedBox(height: 20.0,),
              Text('数据加载中，请稍后', style: TextStyle(fontSize: 15.0),)
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Text('没有更多了'),
      );
    }
  }

}