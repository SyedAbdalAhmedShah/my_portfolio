import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../model/project.dart';

class HelperFunctions {
  Future showProjectDetail(BuildContext context, Project project) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content:
                  // Container(
                  //   width: 300,
                  //   height: 250,
                  //   child: PageView(
                  //     children: project.pictures
                  //             ?.map((pic) => Image(
                  //                   image: AssetImage(pic),
                  //                   fit: BoxFit.fill,
                  //                 ))
                  //             .toList() ??
                  //         [],
                  //   ),
                  // ),

                  ImageSlideshow(
                      width: 250,
                      height: 400,
                      children: project.pictures
                              ?.map((pic) => Image(
                                    image: AssetImage(pic),
                                    fit: BoxFit.fill,
                                  ))
                              .toList() ??
                          []),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
