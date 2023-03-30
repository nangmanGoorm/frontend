import 'package:flutter/material.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/category_select_screen.dart';
import 'package:goorm/mentee/my_bottle_screen.dart';
import 'package:goorm/widgets/bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class SeaBottleScreen extends StatefulWidget {
  const SeaBottleScreen({super.key});

  @override
  State<SeaBottleScreen> createState() => _SeaBottleScreenState();
}

class _SeaBottleScreenState extends State<SeaBottleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/BGdriftbottle.svg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 118,
            bottom: 258,
            child: SizedBox(
              width: 160,
              height: 200,
              child: TextButton(
                child: Lottie.asset('assets/DriftBottleVerticalMoving.json'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategorySelectScreen()),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 96,
            bottom: 222,
            child: SvgPicture.asset('assets/images/wave.svg'),
          ),
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _titleText(),
                const SizedBox(height: 230),
                _middleText(),
                const SizedBox(height: 306),
                _showMyBottleListButton(),
                const SizedBox(height: 40),
                const MyBottomNavigationBar()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText() {
    return Text(
      '도움 요청하기',
      style: MyTextStyle.CwS18W700,
    );
  }

  Widget _middleText() {
    return Text(
      '해류병을 눌러서\n도움을 요청해보세요',
      textAlign: TextAlign.center,
      style: MyTextStyle.CwS18W700Large,
    );
  }

  Widget _showMyBottleListButton() {
    return SizedBox(
      width: 192,
      height: 38,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyBottleScreen(),
            ),
          );
        },
        style: MyButtonStyle.whiteBorder12,
        child: Text(
          '내가 보낸 해류병 보기',
          style: MyTextStyle.CwS14W700,
        ),
      ),
    );
  }
  //TODO: 해류병 등록(전에 받은 category, user_id, message)
}
