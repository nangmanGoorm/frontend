import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/onboarding/nickname_write_screen.dart';
import 'package:goorm/widgets/next_button.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 44),
                  _bigText(),
                  const SizedBox(height: 25),
                  _smallText(),
                  const SizedBox(height: 87),
                  SvgPicture.asset(
                    'assets/images/anything.svg',
                  )
                ],
              ),
              _nextButton()
              // _tutorialImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bigText() {
    return Text(
      '제주 선배에 오신 걸\n환영합니다!',
      style: MyTextStyle.CbS28W700,
    );
  }

  Widget _smallText() {
    return Text(
      '제주 선배와 제주 새내기를 이어주는\n제주의 새로운 소통창구입니다!',
      style: MyTextStyle.CbS18W500,
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NicknameWriteScreen()),
          );
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '제주선배 시작하기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
  // Widget _tutorialImage() {
  // return Image.asset('');
  // }
}
