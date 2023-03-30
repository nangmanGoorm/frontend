import 'package:flutter/material.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';

import 'package:goorm/onboarding/user_type_select_screen.dart';
import 'package:goorm/widgets/next_button.dart';

class NicknameWriteScreen extends StatefulWidget {
  const NicknameWriteScreen({super.key});

  @override
  State<NicknameWriteScreen> createState() => _NicknameWriteScreenState();
}

class _NicknameWriteScreenState extends State<NicknameWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bigText(),
                  const SizedBox(height: 8),
                  _smallText(),
                  const SizedBox(height: 36),
                  _nicknameFormField(),
                ],
              ),
              _nextButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bigText() {
    return Text(
      '회원님을\n어떻게 불러드릴까요?',
      style: MyTextStyle.CbS28W700,
    );
  }

  Widget _smallText() {
    return Text(
      '두 글자 이상 적어주세요!',
      style: MyTextStyle.CbS18W500,
    );
  }

  Widget _nicknameFormField() {
    return TextFormField(
      decoration: InputDecoration(hintText: '예) 애월'),
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
                builder: (context) => const UserTypeSelectScreen()),
          );

          //TODO: nuikname같이 넘기고
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '다음으로',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
}
