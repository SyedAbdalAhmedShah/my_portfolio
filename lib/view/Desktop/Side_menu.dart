// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:my_portfolio/components/Project_tile.dart';
import 'package:my_portfolio/components/background_image_with_text.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/All_projects.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isHovered = false;
  int? hoverIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        BackgroudImageWithText(size: size),
        const ProjectText(),
        ProjectsListviewBuilder(size: size),
        VerticalGap(
          customHeight: size.height * 0.04,
        ),
        ElevatedButton(onPressed: () => print('adasd'), child: Text('see more'))
      ],
    );
  }
}

class ProjectText extends StatelessWidget {
  const ProjectText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            Strings.myProjects,
            style: TextStyle(
                fontSize: Config.middleHeading,
                fontWeight: FontWeight.bold,
                color: Strings.whiteColor),
          ),
        ),
      ],
    );
  }
}

class ProjectsListviewBuilder extends StatelessWidget {
  const ProjectsListviewBuilder({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // itemCount: AllProjects.length,
      // scrollDirection: Axis.horizontal,
      direction: Axis.horizontal,
      // ch: (
      //   context,
      //   index,
      // ) {
      children: List.generate(
          AllProjects.length, (index) => ProjectTile(index: index, size: size)),

      // }),
    );
  }
}
