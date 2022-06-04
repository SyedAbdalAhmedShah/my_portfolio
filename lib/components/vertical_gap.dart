import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  
  final double? customHeight;
  VerticalGap({this.customHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: customHeight ?? 8,
    );
  }
}
