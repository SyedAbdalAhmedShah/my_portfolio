import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';
class FlutterText extends StatelessWidget {
  const FlutterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Text(
       Strings.flutterWithSpecial,
       style: TextStyle(color: Strings.kPrimaryColor),
     );
  }
}