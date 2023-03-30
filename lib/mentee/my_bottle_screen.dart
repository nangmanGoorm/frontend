import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';

class MyBottleScreen extends StatefulWidget {
  const MyBottleScreen({super.key});

  @override
  State<MyBottleScreen> createState() => _MyBottleScreenState();
}

class _MyBottleScreenState extends State<MyBottleScreen> {
  num? selectedHelpeRequest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('보낸 도움요청', style: MyTextStyle.CwS18W700),
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: MyColors.white,
        ),
        backgroundColor: Colors.transparent,
      ),
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
                const SizedBox(height: 88),
                _selectButtons(),
                // const Spacer(),
                // _nextButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectButtons() {
    List<String> categoryList = [
      '농사',
      '어업',
      '카페&베이커리',
      '게스트하우스',
      '식당',
      '편집샵',
      '프리랜서',
      '유통업'
    ];
    return Container(
      width: double.maxFinite,
      height: 470,
      alignment: Alignment.topCenter,
      child: GridView.count(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2, // Two boxes in a row
        childAspectRatio: 154 / 126,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(8, (index) {
          return TextButton(
            style: selectedHelpeRequest == index
                ? MyButtonStyle.categorySelectedButton
                : MyButtonStyle.categoryUnselectedButton,
            onPressed: () {
              setState(() {
                selectedHelpeRequest = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset('assets/images/selected_request.svg'),
                  Text(
                    categoryList[index],
                    style: MyTextStyle.CwS16W600,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
