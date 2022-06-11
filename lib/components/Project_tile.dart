import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/All_projects.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/utils/helper_functions.dart';
import 'package:my_portfolio/utils/strings.dart';

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
  HelperFunctions helperFun = HelperFunctions();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hoveredTransform = Matrix4.identity()..scale(1.06);
    final transform = hoveredTransform;
    return GestureDetector(
      onTap: (() {
        helperFun.showProjectDetail(context, AllProjects[widget.index]);
        // if (kIsWeb && size.width > 800) {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (_) => ProjectDetailScreen(
        //             project: AllProjects[widget.index],
        //           )));
        // } else {}
      }),
      child: MouseRegion(
        onHover: ((event) {
          if (kIsWeb) {
            setState(() {
              isHovered = true;
              hoverIndex = widget.index;
            });
          }
        }),
        onExit: ((event) {
          if (kIsWeb) {
            setState(() {
              isHovered = false;
              hoverIndex = null;
            });
          }
        }),
        // onEnter: (e) => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => Checking())),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white12,
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
          // width: 300,
          height: 170,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackgroundPictureBox(
                size: widget.size,
                image: AllProjects[widget.index].pictures?.first ?? '',
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalGap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AllProjects[widget.index].title.toString(),
                          style: const TextStyle(
                              color: Strings.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Config.smallSize),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          AllProjects[widget.index].description.toString(),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              color: Strings.greyColor,
                              fontSize: Config.xSmallSize)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
