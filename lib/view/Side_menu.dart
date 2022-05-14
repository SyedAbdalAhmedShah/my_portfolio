import 'package:flutter/material.dart';
import 'package:my_portfolio/components/background_image_with_text.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';

class SideMenu extends StatelessWidget {
  final Shader gradText =
      const LinearGradient(colors: [Colors.purple, Colors.red])
          .createShader(const Rect.fromLTWH(0.0, 0.0, 170, 80.0));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        BackgroudImageWithText(size: size),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            Strings.myProjects,
            style: TextStyle(
                fontSize: 4.sp,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = gradText),
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              width: size.width * 0.2,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade800.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
            ),
          ],
        )
      ],
    );
  }
}
