import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';

class FlutterDevTextwithIcon extends StatelessWidget {
  const FlutterDevTextwithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          Strings.flutterDev,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Strings.kPrimaryColor),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.flutter_dash,
          color: Colors.blue,
          size: 10,
        )
      ],
    );
  }
}
