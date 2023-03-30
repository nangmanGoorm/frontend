import 'package:flutter/material.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/onboarding/tutorial_screen.dart';

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
