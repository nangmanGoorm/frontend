import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/my_bottle_screen.dart';
import 'package:goorm/mentor/mentor_bottom_navigation.dart';
import 'package:goorm/mentor/mentor_my_bottle_screen.dart';
import 'package:goorm/widgets/bottom_navigation_bar.dart';

class MentorSendDraftScreen extends StatefulWidget {
  const MentorSendDraftScreen({super.key});

  @override
  State<MentorSendDraftScreen> createState() => _MentorSendDraftScreenState();
}

class _MentorSendDraftScreenState extends State<MentorSendDraftScreen> {
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
              onPressed: () {},
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
                const SizedBox(height: 40),
                _titleText(),
                const SizedBox(height: 230),
                _middleText(),
                const Spacer(),
                _showMyBottleListButton(),
                const SizedBox(height: 14),
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
      '나의 바다',
      style: MyTextStyle.CwS18W700,
    );
  }

  Widget _middleText() {
    return Text(
      '제주후배에게\n해류병을 잘 보냈어요!',
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
              builder: (context) => const MentorMyBottleScreen(),
            ),
          );
        },
        style: MyButtonStyle.whiteBorder12,
        child: Text(
          '내가 보낸 해류병 보기',
          style: MyTextStyle.CwS14W700,
        ),
      ),
    );
  }
}
