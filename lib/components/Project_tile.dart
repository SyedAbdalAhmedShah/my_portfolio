import 'package:flutter/material.dart';
import 'package:my_portfolio/components/background_picture_box.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/All_projects.dart';
import 'package:my_portfolio/view/Desktop/checking.dart';

class ProjectTile extends StatefulWidget {
  final int index;
  final Size size;
  ProjectTile({
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
          onTap: (() => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Checking()))),
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
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                    BacgroundPictureBox(size: widget.size),
                    VerticalGap(size: widget.size),
                    Text(
                      AllProjects.first.title.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    VerticalGap(size: widget.size),
                    Text(AllProjects.first.description.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                        ))
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
