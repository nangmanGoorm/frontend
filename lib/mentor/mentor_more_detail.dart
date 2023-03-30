import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/send_draft_screen.dart';
import 'package:goorm/mentor/mentor_send_draft_screen.dart';

class MentorHelpMoreDetailScreen extends StatefulWidget {
  const MentorHelpMoreDetailScreen({super.key});

  @override
  State<MentorHelpMoreDetailScreen> createState() => _MentorHelpMoreDetailScreen();
}

class _MentorHelpMoreDetailScreen extends State<MentorHelpMoreDetailScreen> {
  num? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //     leading: IconButton(
      //         icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {

      //       }),
      //     backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/BGdriftbottle_with_bottle.svg',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: const Color(0xff1A1A1B).withOpacity(0.64),
                alignment: Alignment.center,
                child: const Text(''),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 68),
                _titleText(),
                const SizedBox(height: 38),
                _textFormField(),
                const Spacer(),
                _nextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText() {
    return Text(
      '제주후배에게\n메세지를 적어주세요!',
      style: MyTextStyle.CwS28W700,
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
            MaterialPageRoute(builder: (context) => const MentorSendDraftScreen()),
          );
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '도움 보내기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }

  Widget _textFormField() {
    return SizedBox(
      width: 320,
      height: 142,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        decoration: const InputDecoration(
          hintText: '예) 안녕하세요 제주살이 새내기입니다. 시작할 때 어떤 것부터 시작할지 잘 모르겠어요.',
        ),
        style: MyTextStyle.CwS16W500,
      ),
    );
  }
}
