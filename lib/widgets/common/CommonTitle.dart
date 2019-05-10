import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;

  CommonTitle({@required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Text('公共组件title例子');
  }
}
