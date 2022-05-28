import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:my_portfolio/components/vertical_gap.dart';
import 'package:sizer/sizer.dart';
import 'package:my_portfolio/components/background_screen.dart';
import 'package:extended_image/extended_image.dart';

import 'package:my_portfolio/model/project.dart';
import 'package:my_portfolio/utils/strings.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;
  ProjectDetailScreen({required this.project});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackGroundScreen(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Strings.backgroundColor,
              alignment: Alignment.center,
              child: ImageSlideshow(
                  width: size.width * 0.5,
                  indicatorColor: Strings.backgroundColor,
                  height: size.height * 0.25,
                  children: project.pictures!
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
            VerticalGap(size: size),
            Align(
              alignment: Alignment.center,
              child: Text(
                project.title.toString(),
                style: TextStyle(color: Strings.greyColor, fontSize: 4.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                project.description.toString(),
                style: TextStyle(color: Strings.greyColor, fontSize: 4.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
