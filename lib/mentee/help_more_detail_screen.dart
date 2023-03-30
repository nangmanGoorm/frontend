import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';

class HelpMoreDetailScreen extends StatefulWidget {
  const HelpMoreDetailScreen({super.key});

  @override
  State<HelpMoreDetailScreen> createState() => _HelpMoreDetailScreen();
}

class _HelpMoreDetailScreen extends State<HelpMoreDetailScreen> {
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
                TextFormField(),
                const Spacer(),
                _nextButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText() {
    return Text(
      '더 자세하게\n알려주세요',
      style: MyTextStyle.CwS28W700,
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => const UserTypeSelectScreen()),
          // );
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '도움 요청하기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }
}
