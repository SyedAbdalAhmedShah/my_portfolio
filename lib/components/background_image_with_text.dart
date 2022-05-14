import 'package:flutter/material.dart';
import 'package:my_portfolio/components/animated_text.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';
class BackgroudImageWithText extends StatelessWidget {
  const BackgroudImageWithText({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: size.height * 0.28,
      width: double.infinity,
      decoration: backgroundImage(),
      padding:const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.discoverAnAmazing,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 6.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
         const CustomAnimatedText(),
        ],
      ),
    );
  }
  BoxDecoration backgroundImage() {
    return BoxDecoration(
    
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image:const AssetImage(
              Strings.backgroundPic,
            ),
            fit: BoxFit.cover));
  }
}