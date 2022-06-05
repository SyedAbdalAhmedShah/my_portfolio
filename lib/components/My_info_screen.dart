import 'package:flutter/material.dart';
import 'package:my_portfolio/components/Experience_Bar.dart';
import 'package:my_portfolio/components/myName.dart';
import 'package:my_portfolio/components/profile_picture.dart';
import 'package:my_portfolio/components/social_icon.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/strings.dart';

import '../utils/config.dart';
import '../view/Desktop/home_screen.dart';
import 'Residence_info.dart';
import 'flutterDev_text_with_icon.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ProfilePIcture(
          size: size,
        ),
        VerticalGap(),
        const MyName(),
        VerticalGap(),
        const FlutterDevTextwithIcon(),
        VerticalGap(),
        VerticalGap(),
        ResidenceInfo(
            text1: Strings.country, text2: Strings.pakistan, size: size),
        ResidenceInfo(text1: Strings.city, text2: Strings.peshawar, size: size),
        ResidenceInfo(text1: Strings.age, text2: Strings.ageNumber, size: size),
        VerticalGap(),
        VerticalGap(),
        skillText(),
        VerticalGap(),
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

  Align skillText() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        Strings.skills,
        style: TextStyle(
            fontSize: Config.middleHeading,
            letterSpacing: 2,
            color: Strings.whiteColor),
      ),
    );
  }
}
