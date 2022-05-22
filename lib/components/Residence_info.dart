import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';

class ResidenceInfo extends StatelessWidget {
  final String text1;
  final String text2;
  final Size size;
  ResidenceInfo({required this.text1, required this.text2, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.01, vertical: size.height * 0.001),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: TextStyle(
                  letterSpacing: 2, fontSize: 3.sp, color: Strings.whiteColor)),
          Text(text2,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  letterSpacing: 2, fontSize: 3.sp, color: Strings.greyColor))
        ],
      ),
    );
  }
}
