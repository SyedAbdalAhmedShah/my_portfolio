import 'package:flutter/material.dart';
class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      const FlutterText(),
        // Text(Strings.iBuild, style: whiteColorTextStyle(),),
        AnimatedTextKit(
          
          animatedTexts: [
            animatedText(Strings.webAndMobileApp),
            animatedText(Strings.ecommerce),
            animatedText(Strings.chatApp),
          ],
          repeatForever: true,
        ),
       
        const FlutterText(),
      ],
    );
  }
   TyperAnimatedText animatedText(String title) => TyperAnimatedText(title ,textStyle: whiteColorTextStyle());
     TextStyle whiteColorTextStyle() => TextStyle(color: Strings.whiteColor);
}