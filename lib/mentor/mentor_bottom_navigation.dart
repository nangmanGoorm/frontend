import 'package:flutter/material.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';

class MentorMyBottomNavigationBar extends StatefulWidget {
  const MentorMyBottomNavigationBar({super.key});

  @override
  State<MentorMyBottomNavigationBar> createState() => _MentorMyBottomNavigationBarState();
}

class _MentorMyBottomNavigationBarState extends State<MentorMyBottomNavigationBar> {
  int index = 0;
  List<String> labelsList = ['나의바다', '채팅', '프로필'];
  List<IconData> iconsList = [
    Icons.speaker,
    Icons.home,
    Icons.chat,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
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
                  child: Icon(
                    iconsList[i],
                    color: MyColors.white,
                  ),
                )
                    : Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Icon(
                    iconsList[i],
                    color: MyColors.unselectedColor,
                  ),
                ),
                label: labelsList[i],
              ),
          ],
          backgroundColor: MyColors.blue500,
          selectedItemColor: MyColors.white,
          unselectedItemColor: const Color(0xff4D6EE9),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: index,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: (int i) {
            setState(() {
              index = i;
              print(index);
            });
          },
        ),
      ),
    );
  }
}
