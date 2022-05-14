import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';

class ExperienceBar extends StatelessWidget {
  final Size size;
  const ExperienceBar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            Strings.experience,
            style: TextStyle(
                fontSize: 3.sp, letterSpacing: 2, color: Colors.white),
          ),
          Container(
              margin: const EdgeInsets.all(8),
              width:
                  size.width > 1200 ? size.width * 0.1 : size.width * 0.1 / 1.5,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular()),
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 0.7),
                  duration: const Duration(seconds: 1),
                  builder: (context, double value, child) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          minHeight: size.height * 0.01,
                          value: value,
                        ),
                      ))),
        ],
      ),
    );
  }
}
