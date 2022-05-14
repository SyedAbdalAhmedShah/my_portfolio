import 'package:flutter/material.dart';

import '../utils/strings.dart';
class ProfilePIcture extends StatelessWidget {
  final Size size;
  const ProfilePIcture({
    required this.size
 
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.14,
      width: size.width * 0.14,
      decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(Strings.myPicture), fit: BoxFit.contain)),
    );
  }
}