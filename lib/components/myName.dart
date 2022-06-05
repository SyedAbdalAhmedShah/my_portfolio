import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/config.dart';

import '../utils/strings.dart';

class MyName extends StatelessWidget {
  const MyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.myName,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 1000
              ? Config.xSmallSize
              : Config.smallSize,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
