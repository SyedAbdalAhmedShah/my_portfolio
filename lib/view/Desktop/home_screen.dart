import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/Experience_Bar.dart';
import 'package:my_portfolio/components/animated_circular_progress.dart';
import 'package:my_portfolio/components/animated_text.dart';
import 'package:my_portfolio/components/flutterDev_text_with_icon.dart';
import 'package:my_portfolio/components/social_icon.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:my_portfolio/view/Desktop/Side_menu.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as mathc;

import '../../components/Residence_info.dart';
import '../../components/background_image_with_text.dart';
import '../../components/profile_picture.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage(Strings.backgroundPicture), fit: BoxFit.fill)),
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.08, horizontal: size.width * 0.06),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: size.width < 800
              ? AppBar(
                  backgroundColor: Strings.backgroundColor,
                  elevation: 0,
                )
              : null,
          body: Row(
            children: [
              if (size.width > 800)
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Strings.backgroundColor,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: buildMyInfo(context, size),
                    ))
              else
                SizedBox(),
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
      ),
    );
  }

  Column buildMyInfo(BuildContext context, Size size) {
    return Column(
      children: [
        ProfilePIcture(
          size: size,
        ),
        VerticalGap(size: size),
        myName(),
        VerticalGap(size: size),
        const FlutterDevTextwithIcon(),
        VerticalGap(size: size),
        VerticalGap(size: size),
        ResidenceInfo(
            text1: Strings.country, text2: Strings.pakistan, size: size),
        ResidenceInfo(text1: Strings.city, text2: Strings.peshawar, size: size),
        ResidenceInfo(text1: Strings.age, text2: Strings.ageNumber, size: size),
        VerticalGap(size: size),
        VerticalGap(size: size),
        skillText(),
        VerticalGap(size: size),
        SkillsProgressBars(
          size: size,
        ),
        Divider(
          indent: size.width * 0.01,
          endIndent: size.width * 0.01,
        ),
        ExperienceBar(size: size),
        Spacer(),
        Row(
          children: [
            SocialIconWithLinks(
              image: Strings.linkedInIcon,
              url: Strings.linkedInLink,
            ),
            SocialIconWithLinks(
              image: Strings.githubIcon,
              url: Strings.githubLink,
            ),
          ],
        )
      ],
    );
  }

  Text myName() {
    return Text(
      Strings.myName,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 3.sp, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Align skillText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        Strings.skills,
        style: TextStyle(fontSize: 3.sp, letterSpacing: 2, color: Colors.white),
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