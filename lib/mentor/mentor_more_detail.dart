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
  State<MentorHelpMoreDetailScreen> createState() =>
      _MentorHelpMoreDetailScreen();
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
                const SizedBox(height: 55),
                _titleText(),
                const SizedBox(height: 35),
                _menti(),
                const SizedBox(height: 15),
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

  Widget _menti() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.maxFinite,
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/avatar.svg',
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "제주샌애기",
                style: MyTextStyle.CwS18W700,
              ),
              Container(
                margin: EdgeInsets.only(top: 1.0, bottom: 1.0),
                padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
                child: Text(
                  "숙박업",
                  style: MyTextStyle.jobText,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              Text(
                "2023.3.31",
                style: MyTextStyle.CgS12W500,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  "어릴 때부터 게스트 하우스 차리는 게 꿈이었어요 자본금 5000만원을 모았는데 이 돈으로 게하 창업 가능할까요? 간절합니다 도와주세요 애월에 차리고 싶어요",
                  maxLines: 2,
                  softWrap: false,
                  style: MyTextStyle.listBuilderText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
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
                builder: (context) => const MentorSendDraftScreen()),
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
          hintText: '후배들에게 하고 싶은 조언을 적어주세요!',
        ),
        style: MyTextStyle.CwS16W500,
      ),
    );
  }
}
