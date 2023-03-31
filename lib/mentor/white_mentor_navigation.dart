import 'package:flutter/material.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/chatting_screen.dart';
import 'package:goorm/mentee/my_bottle_screen.dart';
import 'package:goorm/mentee/home_screen.dart';
import 'package:goorm/mentee/sea_bottle_screen.dart';
import 'package:goorm/mentor/mentor_sea_bottle_screen.dart';

class WhiteMentorMyBottomNavigationBar extends StatefulWidget {
  const WhiteMentorMyBottomNavigationBar({super.key});

  @override
  State<WhiteMentorMyBottomNavigationBar> createState() =>
      _WhiteMentorMyBottomNavigationBarState();
}

class _WhiteMentorMyBottomNavigationBarState
    extends State<WhiteMentorMyBottomNavigationBar> {
  int index = 1;
  List<String> labelsList = ['나의바다', '채팅', '프로필'];
  List<AssetImage> iconsList = [
    AssetImage('assets/images/IconBottle.png'),
    AssetImage('assets/images/IconChat.png'),
    AssetImage('assets/images/IconProfile.png'),
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
                      child: ImageIcon(
                        iconsList[i],
                        color: MyColors.unselectedColor,
                      ),
                    )
                  : Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ImageIcon(
                        iconsList[i],
                        color: const Color(0xffBABABB),
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
                builder: (context) => const MentorSeaBottleScreen(),
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
