
import 'package:flutter/material.dart';

import 'package:my_portfolio/components/My_info_screen.dart';
import 'package:my_portfolio/components/animated_circular_progress.dart';

import 'package:my_portfolio/components/background_screen.dart';

import 'package:my_portfolio/utils/strings.dart';
import 'package:my_portfolio/view/Desktop/Side_menu.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    return BackGroundScreen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
   
        body: Row(
          children: [
            if (size.width > 100)
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Strings.backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: MyInfoScreen()))
            else
              const SizedBox.shrink(),
            const VerticalDivider(
              width: 3,
              thickness: 3,
            ),
            Expanded(
                flex: 7,
                child: Container(
                  color: const Color(0xFF18191A),
                  child: SideMenu(),
                ))
          ],
        ),
      ),
    );
  }

 

  

  
}

class SkillsProgressBars extends StatelessWidget {
  final Size size;
  const SkillsProgressBars({required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        AnimatedCircularProgressIndicator(
            size: size, catagoryName: Strings.flutter, percentage: 0.7),
        AnimatedCircularProgressIndicator(
            size: size, catagoryName: Strings.firebase, percentage: 0.6),
        AnimatedCircularProgressIndicator(
            size: size, catagoryName: Strings.typeScript, percentage: 0.4),
      ],
    );
  }
}
