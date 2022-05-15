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
      children: [
        Text(
          Strings.flutterDev,
          style: TextStyle(
              fontSize: 3.sp,
              fontWeight: FontWeight.bold,
              color: Strings.kPrimaryColor),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.flutter_dash,
          color: Colors.blue,
          size: 3.sp,
        )
      ],
    );
  }
}
