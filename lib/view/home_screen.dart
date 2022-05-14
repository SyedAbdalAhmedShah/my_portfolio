import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/components/animated_text.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as mathc;

import '../components/Residence_info.dart';
import '../components/background_image_with_text.dart';
import '../components/profile_picture.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage(Strings.backgroundPicture), fit: BoxFit.fill)),
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.08, horizontal: size.width * 0.06),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          
          backgroundColor: Colors.transparent,
          drawer: Visibility(child: Drawer(child: buildMyInfo(context, size))),
          appBar: size.width < 800
              ? AppBar(
                  backgroundColor: Strings.backgroundColor,
                  elevation: 0,
                )
              : null,
          body: Row(
            children: [
              if (size.width > 800)
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Strings.backgroundColor,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: buildMyInfo(context, size),
                    ))
              else
                SizedBox(),
              const VerticalDivider(
                width: 3,
                thickness: 3,
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    color: const Color(0xFF18191A),
                    child: SideMenu(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  ListView buildMyInfo(BuildContext context, Size size) {
    return ListView(
      children: [
        ProfilePIcture(size: size,),
        verticalGap(size),
        myName(),
        verticalGap(size),
        FlutterDevTextwithIcon(),
        verticalGap(size),
        verticalGap(size),
        ResidenceInfo(text1: Strings.country,text2: Strings.pakistan,size: size),
        ResidenceInfo(text1: Strings.city,text2: Strings.peshawar, size:size),
        ResidenceInfo(text1:.age,text2: Strings.ageNumber, size: size),
        verticalGap(size),
        verticalGap(size),
        skillText(),
        verticalGap(size),
        skillsProgressBars(size),
        Divider(
          indent: size.width * 0.01,
          endIndent: size.width * 0.01,
        ),
        experienceBar(size)
      ],
    );
  }

  Padding experienceBar(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            Strings.experience,
            style: TextStyle(fontSize: 3.sp, letterSpacing: 2 , color: Colors.white),
          ),
          Container(
              margin: EdgeInsets.all(8),
              width:
                  size.width > 1200 ? size.width*  0.1 : size.width*  0.1 / 1.5,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular()),
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 0.7),
                  duration: Duration(seconds: 1),
                  builder: (context, double value, child) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          minHeight: size.height * 0.01,
                          value: value,
                        ),
                      ))),
        ],
      ),
    );
  }

  Row skillsProgressBars(Size size) {
    return Row(
      children: [
        animatedCircularProgressIndicator(
            size: size, catagoryName: Strings.flutter, percentage: 0.7),
        animatedCircularProgressIndicator(
            size: size, catagoryName: Strings.firebase, percentage: 0.6),
        animatedCircularProgressIndicator(
            size: size, catagoryName: Strings.typeScript, percentage: 0.4),
      ],
    );
  }

  Text myName() {
    return Text(
      Strings.myName,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.bold,color: Colors.white ),
    );
  }

  Row FlutterDevTextwithIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.flutterDev,
          style: TextStyle(
              fontSize: 3.sp,
              fontWeight: FontWeight.bold,
              color: Strings.kPrimaryColor),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.flutter_dash,
          color: Colors.blue,
          size: 3.sp,
        )
      ],
    );
  }

  Align skillText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        Strings.skills,
        style: TextStyle(fontSize: 3.sp, letterSpacing: 2, color: Colors.white),
      ),
    );
  }

  Container animatedCircularProgressIndicator(
      {required Size size,
      required String catagoryName,
      required double percentage}) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.height  *0.01, horizontal: size.width * 0.01),
      width: size.width * 0.04,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percentage),
                duration: const Duration(seconds: 1),
                builder: (context, double value, child) => Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          color: Strings.kPrimaryColor,
                          value: value,
                          strokeWidth: 3,
                          backgroundColor: Strings.backgroundColor,
                        ),
                        Center(
                            child: Text(
                          (value * 100).toInt().toString() + '%',
                          style: TextStyle(fontSize: 3.sp , color: Colors.white),
                        ))
                      ],
                    )),
          ),
          verticalGap(size),
          FittedBox(
            child: Text(
              catagoryName,
              style: TextStyle(fontSize: 3.sp, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  

  SizedBox verticalGap(Size size) {
    return SizedBox(
      height: size.height * 0.01,
    );
  }
}


class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        BackgroudImageWithText(size: size)
      ],
    );
  }

 



  
}









