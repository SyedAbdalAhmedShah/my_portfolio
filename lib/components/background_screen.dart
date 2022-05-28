import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';

class BackGroundScreen extends StatelessWidget {
  final Widget child;
  const BackGroundScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
                image: AssetImage(Strings.backgroundPicture),
                fit: BoxFit.fill)),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.08, horizontal: size.width * 0.06),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: child,
        ));
  }
}
