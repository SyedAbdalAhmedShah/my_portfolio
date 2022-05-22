import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';

class BacgroundPictureBox extends StatelessWidget {
  final Size size;
  final String image;
  BacgroundPictureBox({required this.size, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      decoration: BoxDecoration(
          color: Strings.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          image: DecorationImage(
            image: AssetImage(image),
          )),
    );
  }
}
