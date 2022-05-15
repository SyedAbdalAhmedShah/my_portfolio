import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';

class BacgroundPictureBox extends StatelessWidget {
  final Size size;
  BacgroundPictureBox({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          image: DecorationImage(
              image: AssetImage(Strings.backgroundPic), fit: BoxFit.fill)),
    );
  }
}
