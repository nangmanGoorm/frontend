import 'package:flutter/material.dart';
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
      '제주 선배는\n이런 서비스입니다.',
      style: MyTextStyle.CbS28W700,
    );
  }

  Widget _smallText() {
    return Text(
      '제주 선배에 대한 설명을\n여기에 적어주세요.',
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
          '다음으로',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
  // Widget _tutorialImage() {
  // return Image.asset('');
  // }
}
