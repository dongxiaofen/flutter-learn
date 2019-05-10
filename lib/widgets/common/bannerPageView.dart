import 'package:flutter/material.dart';
import 'dart:async';

class BannerPageView extends StatefulWidget {
  final List banner;

  BannerPageView(this.banner, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BannerPageView();
  // Widget build(BuildContext context) {
  //   return Text('公共组件title例子');
  // }
}

class _BannerPageView extends State<BannerPageView> {
  int virtualIndex = 0;
  int realIndex = 1;
  PageController controller;
  Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage:  realIndex);
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      print('this is timer ${realIndex + 1}');
      controller.animateToPage(
        realIndex + 1,
        duration: Duration(microseconds: 300),
        curve: Curves.bounceInOut
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: _onPageChanged,
            controller: controller,
            children: _buildItems(),
          ),
          renderIndicator()
        ],
      ),
    );
  }

  _onPageChanged(int index) {
    print('this is index $index');
    realIndex = index;
    int count = widget.banner.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
  }

  List<Widget> _buildItems() {
    List<Widget> items = [];
    if (widget.banner.length > 0) {
      items.add(renderItem(widget.banner[widget.banner.length - 1]));
      items.addAll(
        widget.banner.map((itemData) => renderItem(itemData)).toList(growable: false)
      );
      items.add(renderItem(widget.banner[0]));
    }
    return items;
  }
  Widget renderItem(itemData) {
    return GestureDetector(
      onTap: () {
        print('this is banner item $itemData');
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(itemData['image'], fit: BoxFit.cover,),
          renderItemTitle(itemData['title'])
        ],
      ),
    );
  }
  Widget renderItemTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: const Alignment(0.0, -0.7),
          colors: [const Color(0xa0000000), Colors.transparent]
        )
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18.0),),
      ),
    );
  }
  Widget renderIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.banner.length; i++) {
      list.add(Container(
        width: 6.0,
        height: 6.0,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == virtualIndex ? Colors.white : Colors.grey
        ),
      ));
    }
    return Row(
      children: list,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}