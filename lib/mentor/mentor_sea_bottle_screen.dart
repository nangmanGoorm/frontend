import 'package:flutter/material.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/category_select_screen.dart';
import 'package:goorm/mentee/my_bottle_screen.dart';
import 'package:goorm/widgets/bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/mentor/mentor_bottom_navigation.dart';

class MentorSeaBottleScreen extends StatefulWidget {
  const MentorSeaBottleScreen({super.key});

  @override
  State<MentorSeaBottleScreen> createState() => _MentorSeaBottleScreenState();
}

class _MentorSeaBottleScreenState extends State<MentorSeaBottleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/BGdriftbottle.svg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 96,
            bottom: 242,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategorySelectScreen()),
                );
              },
              child: SvgPicture.asset('assets/images/drift_bottle.svg'),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _titleText(),
                const SizedBox(height: 230),
                _middleText(),
                const SizedBox(height: 306),
                _showMyBottleListButton(),
                const MentorMyBottomNavigationBar()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText() {
    return Text(
      '도움 요청하기',
      style: MyTextStyle.CwS18W700,
    );
  }

  Widget _middleText() {
    return Text(
      '해류병을 눌러서\n제 후배들에게 도움을 줄 수 있어요',
      textAlign: TextAlign.center,
      style: MyTextStyle.CwS18W700,
    );
  }

  Widget _showMyBottleListButton() {
    return SizedBox(
      width: 192,
      height: 38,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyBottleScreen(),
            ),
          );
        },
        style: MyButtonStyle.whiteBorder12,
        child: Text(
          '도움을 기다리는 후배 보기',
          style: MyTextStyle.CwS14W700,
        ),
      ),
    );
  }
}
