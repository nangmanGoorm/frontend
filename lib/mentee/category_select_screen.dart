import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/help_more_detail_screen.dart';

class CategorySelectScreen extends StatefulWidget {
  const CategorySelectScreen({super.key});

  @override
  State<CategorySelectScreen> createState() => _CategorySelectScreenState();
}

class _CategorySelectScreenState extends State<CategorySelectScreen> {
  num? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: MyColors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
      '어떤 도움이\n필요하신가요?',
      style: MyTextStyle.CwS28W700,
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
        childAspectRatio: 154 / 80,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(8, (index) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.home,
                    color: MyColors.white,
                  ),
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

  Widget _nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HelpMoreDetailScreen()),
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
