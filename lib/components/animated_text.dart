import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/flutter_text.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/utils/strings.dart';
class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      const FlutterText(),
        Text(Strings.iBuild, style: whiteColorTextStyle(),),
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
  TextStyle whiteColorTextStyle() => const TextStyle(
      color: Strings.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: Config.smallSize);
}