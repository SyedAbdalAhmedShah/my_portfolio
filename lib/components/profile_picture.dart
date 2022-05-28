import 'package:flutter/material.dart';

import '../utils/strings.dart';
class ProfilePIcture extends StatelessWidget {
  final Size size;
  const ProfilePIcture({
    required this.size
 
  }) ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => showPictureInDialog(context, Strings.myPicture)),
      child: Container(
        height: size.height * 0.14,
        width: size.width * 0.14,
        decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(Strings.myPicture), fit: BoxFit.contain)),
      ),
    );
  }

  showPictureInDialog(BuildContext context, String image) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Image(
                image: AssetImage(image),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}