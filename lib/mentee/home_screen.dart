import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:goorm/consts/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [recentOffer()],
      ),
    );
  }

  Widget recentOffer() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Text(
          '🤙🏻 최근 받은 제안',
          style: MyTextStyle.CbS18W500,
        ),
        Column(
          children: [],
        )
      ]),
    );
  }

  Widget mentorInfo() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset('assets/images/avatar.svg'),
            Text(
              '게하총총 선배',
              style: MyTextStyle.CbS14W700,
            )
          ],
        )
      ],
    );
  }
}
