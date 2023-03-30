// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/input_decoration.dart';
import 'package:goorm/onboarding/tutorial_screen.dart';

import 'package:goorm/onboarding_screen.dart';
import 'package:goorm/mentor/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goorm',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: MyColors.white,
        inputDecorationTheme: MyInputDecorationTheme.defaultInputDecoration,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: MyColors.black),
          shadowColor: Colors.transparent,
          color: Colors.transparent,
        ),
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: const TutorialScreen(),
        ),
      ),
    );
  }
}
