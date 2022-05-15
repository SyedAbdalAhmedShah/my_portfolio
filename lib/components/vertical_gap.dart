import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  final Size size;
  final double? customHeight;
  VerticalGap({required this.size, this.customHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: customHeight ?? size.height * 0.01,
    );
  }
}
