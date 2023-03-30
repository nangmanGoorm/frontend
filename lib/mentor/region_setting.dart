





// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';

import '../consts/button_style.dart';
import '../consts/colors.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:goorm/mentor/help.dart';
import 'package:goorm/mentor/profile.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/widgets/bottom_navigation_bar.dart';
import 'package:goorm/mentor/mentor_sea_bottle_screen.dart';


class Region extends StatefulWidget {
  const Region({super.key});

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  num? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.white,
          ),
          backgroundColor: Colors.transparent),
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
                _selectButtons(),
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
      '제주의 어느 지역에서\n활동하시나요?',
      style: MyTextStyle.CwS28W700,
    );
  }

  Widget _selectButtons() {
    List<String> categoryList = [
      '가파도','가파도','가파도',
      '가파도','가파도','가파도',
      '가파도','가파도','가파도',
      '가파도','가파도','가파도',
      '가파도','가파도','가파도',
      '가파도','가파도'
    ];
    return Container(
      width: double.maxFinite,
      height: 470,
      alignment: Alignment.topCenter,
      child: GridView.count(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3, // Two boxes in a row
        childAspectRatio: 154 / 80,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(17, (index) {
          return TextButton(
            style: selectedCategory == index
                ? MyButtonStyle.categorySelectedButton
                : MyButtonStyle.categoryUnselectedButton,
            onPressed: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              child:
                  Text(
                    categoryList[index],
                    style: MyTextStyle.CwS16W600,
                  )

              ),
          );
        }),
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
                builder: (context) => const MentorSeaBottleScreen()),
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
}