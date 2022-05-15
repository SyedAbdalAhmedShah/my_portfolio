// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:my_portfolio/components/Project_tile.dart';
import 'package:my_portfolio/components/background_image_with_text.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/strings.dart';
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
          size: size,
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
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            Strings.myProjects,
            style: TextStyle(
                fontSize: 4.sp,
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
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          primary: true,
          itemBuilder: (
            context,
            index,
          ) {
            return ProjectTile(index: index, size: size);
          }),
    );
  }
}
