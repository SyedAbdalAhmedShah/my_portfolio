import 'package:flutter/material.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/project_detail_scree.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/All_projects.dart';
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
    return Row(
      children: [
        InkWell(
          onTap: (() => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProjectDetailScreen(
                    project: AllProjects.first,
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
              duration: Duration(milliseconds: 200),
              transform:
                  hoverIndex == widget.index ? transform : Matrix4.identity(),
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                width: widget.size.width * 0.2,
                height: widget.size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset:
                            const Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BackgroundPictureBox(
                      size: widget.size,
                      image: AllProjects.first.pictures?.first ?? '',
                    ),
                    VerticalGap(size: widget.size),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AllProjects.first.title.toString(),
                        style: const TextStyle(
                            color: Strings.greyColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          AllProjects.first.description!.length > 80
                              ? AllProjects.first.description!
                                      .substring(0, 80) +
                                  '...'
                              : AllProjects.first.description.toString(),
                          style: const TextStyle(color: Strings.greyColor)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
