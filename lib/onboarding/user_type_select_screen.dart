import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/sea_bottle_screen.dart';
import 'package:goorm/mentor/help.dart';
import 'package:goorm/mentor/home.dart';
import 'package:goorm/widgets/next_button.dart';

class UserTypeSelectScreen extends StatefulWidget {
  const UserTypeSelectScreen({super.key});

  @override
  State<UserTypeSelectScreen> createState() => UserTypeSelectScreenState();
}

class UserTypeSelectScreenState extends State<UserTypeSelectScreen> {
  bool? isMentee;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_rounded),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bigText(),
                  const SizedBox(height: 66),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _selectButton(Image.asset('assets/images/needHelp.png'),
                          '선배의 도움이\n필요해요', false),
                      _selectButton(Image.asset('assets/images/wantToHelp.png'),
                          '후배에게\n도움을 줄래요', true)
                    ],
                  ),
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
      '어떤 도움이\n필요하신가요?',
      style: MyTextStyle.CbS28W700,
    );
  }

  Widget _selectButton(Image image, String buttonText, bool _isMentee) {
    return SizedBox(
      width: 154,
      height: 300,
      child: TextButton(
        style: isMentee == _isMentee && isMentee != null
            ? MyButtonStyle.roleSelectButtonEnabled
            : MyButtonStyle.roleSelectButtonDisabled,
        onPressed: () {
          setState(() {
            isMentee = _isMentee;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 8),
            Text(
              buttonText,
              style: isMentee == _isMentee
                  ? MyTextStyle.CpS18W700
                  : MyTextStyle.CgS18W700,
            ),
          ],
        ),
      ),
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: () {
          if (isMentee != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    isMentee! ? Help() : const SeaBottleScreen(),
              ),
            );
          }
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '제주선배 시작하기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
}
