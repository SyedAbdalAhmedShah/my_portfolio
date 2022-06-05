

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/config.dart';
import 'package:my_portfolio/view/Desktop/home_screen.dart';
import 'package:my_portfolio/view/Tablet/tablet_homeScreen.dart';
import 'package:my_portfolio/view/Tablet/test.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          textTheme: GoogleFonts.averiaLibreTextTheme(),

          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 2460,
          minWidth: 480,
          defaultScale: true,
        debugLog: true,
          breakpoints: const [
            ResponsiveBreakpoint.autoScale(
              480,
              name: MOBILE,
            ),
          ResponsiveBreakpoint.resize(1000, name: TABLET),
          ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K')
          ],
        ),
      routes: {
        "/": (context) => MediaQuery.of(context).size.width < 1000
            ? TabletHomeScreen()
            : HomeScreen()
      },
        initialRoute: "/",
   
  
    );
  }
}
