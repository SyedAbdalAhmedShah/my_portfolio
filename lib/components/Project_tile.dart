import 'package:flutter/material.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/project_detail_scree.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/All_projects.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/utils/strings.dart';

import '../model/project.dart';

class ProjectTile extends StatefulWidget {
  final int index;
  final Size size;

  const ProjectTile({
    required this.index,
    required this.size,
  });

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  int? hoverIndex;
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(1.06);
    final transform = hoveredTransform;
    return InkWell(
      onTap: (() => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProjectDetailScreen(
                project: AllProjects[widget.index],
              )))),
      child: MouseRegion(
        onHover: ((event) => setState(() {
              isHovered = true;
              hoverIndex = widget.index;
            })),
        onExit: ((event) => setState(() {
              isHovered = false;
              hoverIndex = null;
            })),
        // onEnter: (e) => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => Checking())),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5)),
          transform:
              hoverIndex == widget.index ? transform : Matrix4.identity(),
          width: 300,
          height: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BackgroundPictureBox(
                size: widget.size,
                image: AllProjects[widget.index].pictures?.first ?? '',
              ),
              Text(
                  AllProjects[widget.index].description!.length > 80
                      ? AllProjects[widget.index]
                              .description!
                              .substring(0, 80) +
                          '...'
                      : AllProjects[widget.index].description.toString(),
                  style: const TextStyle(
                      
                      color: Strings.greyColor,
                          fontSize: Config.xSmallSize))
              // VerticalGap(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       AllProjects[widget.index].title.toString(),
              //       style: const TextStyle(
              //           color: Strings.greyColor,
              //           fontWeight: FontWeight.bold,
              //           fontSize: Config.xSmallSize),
              //     ),

              //   ],
              // )
            ],
          ),
        ),
      ),
    
    );
  }
}
