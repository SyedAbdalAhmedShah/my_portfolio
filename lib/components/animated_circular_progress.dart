import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';
class AnimatedCircularProgressIndicator extends StatelessWidget {
  final String catagoryName;
 final double percentage;
 final Size size;

   AnimatedCircularProgressIndicator({
   required  this.catagoryName,
      required this.percentage,
      required  this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //     vertical: size.height  *0.01, horizontal: size.width * 0.01),
      width: 50,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percentage),
                duration: const Duration(seconds: 1),
                builder: (context, double value, child) => Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          color: Strings.kPrimaryColor,
                          value: value,
                          strokeWidth: 3,
                          backgroundColor: Strings.backgroundColor,
                        ),
                        Center(
                            child: Text(
                          (value * 100).toInt().toString() + '%',
                          style: const TextStyle(
                              fontSize: Config.smallSize, color: Colors.white),
                        ))
                      ],
                    )),
          ),
          const SizedBox(
            height: 5,
          ),
          // verticalGap(size),
          FittedBox(
            child: Text(
              catagoryName,
              style: const TextStyle(
                  fontSize: Config.smallSize, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
