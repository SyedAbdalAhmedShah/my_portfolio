import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_portfolio/components/Project_tile.dart';
import 'package:my_portfolio/components/animated_text.dart';
import 'package:my_portfolio/components/myName.dart';
import 'package:my_portfolio/components/social_icon.dart';
import 'package:my_portfolio/utils/All_projects.dart';
import 'package:my_portfolio/utils/config.dart';

import '../../components/Experience_Bar.dart';
import '../../components/Residence_info.dart';
import '../../components/flutterDev_text_with_icon.dart';
import '../../components/profile_picture.dart';
import '../../components/vertical_gap.dart';
import '../../utils/strings.dart';
import '../Desktop/home_screen.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Strings.backgroundColor,
        // drawer: Drawer(
        //   child: MyInfoScreen(),
        // ),
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomAnimatedText(),
                  ],
                ),
                VerticalGap(),
                TabletViewHeader(size: size),
                VerticalGap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceBar(size: size),
                    OutlinedButton.icon(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all<Size>(Size(100, 30))),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.file_open,
                          size: 10.0,
                        ),
                        label: const Text(
                          Strings.resume,
                          style: TextStyle(fontSize: Config.xSmallSize),
                        ))
                  ],
                ),
                const Divider(),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 20,
                      )),
                  itemCount: AllProjects.length,
                  itemBuilder: ((context, index) =>
                      ProjectTile(index: index, size: size)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabletViewHeader extends StatelessWidget {
  const TabletViewHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilePIcture(
              size: size,
            ),
            VerticalGap(),
            const MyName(),
            VerticalGap(),
            const FlutterDevTextwithIcon(),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VerticalGap(),
              // VerticalGap(),
              // VerticalGap(),
              ResidenceInfo(
                  text1: Strings.country, text2: Strings.pakistan, size: size),
              const Divider(),
              // VerticalGap(),
              ResidenceInfo(
                  text1: Strings.city, text2: Strings.peshawar, size: size),
              const Divider(),
              VerticalGap(),
              ResidenceInfo(
                  text1: Strings.age, text2: Strings.ageNumber, size: size),
              const Divider(),
              // VerticalGap(),
              SkillsProgressBars(
                size: size,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            SocialIconWithLinks(
              image: Strings.linkedInIcon,
              url: Strings.linkedInLink,
            ),
            const SizedBox(
              height: 20,
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
}
