import 'package:flutter/material.dart';
class VerticalGap extends StatelessWidget {
  final Size size;
   VerticalGap({
required this.size
  }) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.01,
    );
  }
}
