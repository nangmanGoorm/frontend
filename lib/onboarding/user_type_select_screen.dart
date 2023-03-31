import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/sea_bottle_screen.dart';
import 'package:goorm/mentor/help.dart';
import 'package:goorm/mentor/home.dart';
import 'package:goorm/widgets/next_button.dart';
import 'package:goorm/mentor/home.dart';

class UserTypeSelectScreen extends StatefulWidget {
  final String nickname;
  const UserTypeSelectScreen({super.key, required this.nickname});

  @override
  State<UserTypeSelectScreen> createState() => UserTypeSelectScreenState();
}

class UserTypeSelectScreenState extends State<UserTypeSelectScreen> {
  bool? isMentee;
  String? nickname;

  @override
  void initState() {
    nickname = widget.nickname;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: MyColors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [_selectJuniorButton(), _selectSeniorButton()],
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
      nickname != null ? '$nickname님은\n어떤 사람인가요?' : '회원님은 어떤 사람인가요?',
      style: MyTextStyle.CbS28W700,
    );
  }

  Widget _selectJuniorButton() {
    return SizedBox(
      width: 170,
      height: 320,
      child: TextButton(
        style: isMentee != null && isMentee == true
            ? MyButtonStyle.roleSelectButtonEnabled
            : MyButtonStyle.roleSelectButtonDisabled,
        onPressed: () {
          setState(() {
            isMentee = true;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/needHelp.png'),
            const SizedBox(height: 8),
            Text(
              '도움이 필요한',
              style: isMentee == true
                  ? MyTextStyle.CpS14W500
                  : MyTextStyle.CgS14W500gray700,
            ),
            Text(
              '제주후배',
              style: isMentee == true
                  ? MyTextStyle.CpS18W700
                  : MyTextStyle.CgS18W700,
            )
          ],
        ),
      ),
    );
  }

  Widget _selectSeniorButton() {
    return SizedBox(
      width: 170,
      height: 320,
      child: TextButton(
        style: isMentee != null && isMentee == false
            ? MyButtonStyle.roleSelectButtonEnabled
            : MyButtonStyle.roleSelectButtonDisabled,
        onPressed: () {
          setState(() {
            isMentee = false;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/wantToHelp.png'),
            const SizedBox(height: 8),
            Text(
              '도움을 주는',
              style: isMentee == false
                  ? MyTextStyle.CpS14W500
                  : MyTextStyle.CgS14W500gray700,
            ),
            Text(
              '제주선배',
              style: isMentee == false
                  ? MyTextStyle.CpS18W700
                  : MyTextStyle.CgS18W700,
            )
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
                    isMentee! ? const SeaBottleScreen() : const Home(),
              ),
            );
          }
        },
        style: isMentee == null
            ? MyButtonStyle.nextButtonStyleDisabled
            : MyButtonStyle.nextButtonStyle,
        child: Text(
          '제주선배 시작하기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
}
