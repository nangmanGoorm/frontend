import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/chatting_screen.dart';
import 'package:goorm/mentee/my_bottle_screen.dart';
import 'package:goorm/mentee/home_screen.dart';
import 'package:goorm/mentee/sea_bottle_screen.dart';

class WhiteMyBottomNavigationBar extends StatefulWidget {
  const WhiteMyBottomNavigationBar({super.key});

  @override
  State<WhiteMyBottomNavigationBar> createState() =>
      _WhiteMyBottomNavigationBarState();
}

class _WhiteMyBottomNavigationBarState
    extends State<WhiteMyBottomNavigationBar> {
  int index = 1;
  List<String> labelsList = ['나의바다', '채팅', '프로필'];
  List<SvgPicture> grayImagesList = [
    SvgPicture.asset('assets/images/IconBottleBlack.svg'),
    SvgPicture.asset('assets/images/IconChatBlack.svg'),
    SvgPicture.asset('assets/images/IconProfileBlack.svg'),
  ];
  List<SvgPicture> blueImagesList = [
    SvgPicture.asset('assets/images/mysea_blue.svg'),
    SvgPicture.asset('assets/images/chat_blue.svg'),
    SvgPicture.asset('assets/images/profile_blue.svg'),
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(16),
      //   boxShadow: [
      //     BoxShadow(
      //       color: const Color(0xff1A1A1B).withOpacity(0.04),
      //       spreadRadius: 0,
      //       blurRadius: 48,
      //       offset: const Offset(16, 16), // changes position of shadow
      //     ),
      //     BoxShadow(
      //       color: const Color(0xff1A1A1B).withOpacity(0.02),
      //       spreadRadius: 0,
      //       blurRadius: 48,
      //       offset: const Offset(0, 0), // changes position of shadow
      //     ),
      //   ],
      // ),
      borderRadius: BorderRadius.circular(16),
      // width: double.maxFinite,
      // padding: const EdgeInsets.only(bottom: 20),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < labelsList.length; i++)
            BottomNavigationBarItem(
              icon: index == i
                  ? Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: SizedBox(
                          width: 20, height: 20, child: blueImagesList[i]))
                  : Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Opacity(
                          child: grayImagesList[i],
                          opacity: 0.3,
                        ),
                      ),
                    ),
              label: labelsList[i],
            ),
        ],
        backgroundColor: MyColors.white,
        selectedItemColor: const Color(0xff4D6EE9),
        unselectedItemColor: const Color(0xffBABABB),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: index,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) {
          setState(() {
            index = i;
          });
          if (index == 0) {
            //TODO: 이동하는 페이지 바꿔주기
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SeaBottleScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChattingScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
