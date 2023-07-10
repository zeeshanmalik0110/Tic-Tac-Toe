import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/constants.dart';
import 'package:flutter_tic_tac_toe/home.dart';
import 'package:flutter_tic_tac_toe/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Fira",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      //  AnimatedSplashScreen(
      // splash: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             "Let's Play the Game",
      //             style: TextStyle(
      //                 color: whiteColor,
      //                 fontSize: 30,
      //                 fontWeight: FontWeight.bold),
      //           )
      //         ],
      //       ),
      // Container(
      //   child: Image(
      //     image:
      //         AssetImage("assests/fonts/images/splash_screen.png"),
      //     // fit: BoxFit.fill,
      //   ),
      // ),
      //       ],
      //     ),
      //   ),
      //   duration: 3000,
      //   splashTransition: SplashTransition.slideTransition,
      //   backgroundColor: blackColor,
      //   nextScreen: SplashScreen(),
      // ),
    );
  }
}
