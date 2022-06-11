
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:sizer/sizer.dart';
import 'package:my_portfolio/components/background_screen.dart';


import 'package:my_portfolio/model/project.dart';
import 'package:my_portfolio/utils/strings.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;
  ProjectDetailScreen({required this.project});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
   
    return BackGroundScreen(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Strings.backgroundColor,
              alignment: Alignment.center,
              child: ImageSlideshow(
                  width: 100,
                  indicatorColor: Strings.backgroundColor,
                  height: 75,
                  children: widget.project.pictures!
                      .map(
                        (image) => InkWell(
                         
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: Image(   
                                      image: AssetImage(image),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Back'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  )),
                          child: Image(
                            image: AssetImage(image),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .toList()),
            
            ),
            VerticalGap(),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.project.title.toString(),
                style: const TextStyle(
                    color: Strings.greyColor, fontSize: Config.smallSize),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.project.description.toString(),
                style: const TextStyle(
                    color: Strings.greyColor, fontSize: Config.smallSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}
