import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goorm/mentor/home.dart';
import 'package:goorm/mentor/white_mentor_navigation.dart';

import '../consts/button_style.dart';
import '../consts/colors.dart';
import '../consts/text_style.dart';
import '../mentee/my_bottle_screen.dart';
import 'mentor_bottom_navigation.dart';

//
//

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('게하총총 선배', style: MyTextStyle.CbS18W700),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.gray600,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/images/profile2.svg')
      ),
      bottomNavigationBar: WhiteMentorMyBottomNavigationBar(),
    );
  }
}
//
//
// class ProfileFix extends StatefulWidget {
//   const ProfileFix({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileFix> createState() => _ProfileFixState();
// }
//
// class _ProfileFixState extends State<ProfileFix> {
//   List<bool> _isSelected = [false, false, false, false, false, false, false];
//   List<Widget> job = [
//     Text('농사'),
//     Text('어업'),
//     Text('카페&베이커리'),
//     Text('게스트하우스'),
//     Text('식당'),
//     Text('편집샵'),
//     Text('프리랜서')
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.grey),
//         elevation: 0.0,
//       ),
//       body: Column(
//         children: [
//           profileFixTitle,
//           Column(
//             children: List<Widget>.generate(
//               7,
//                   (int index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.0),
//                   child: ToggleButtons(
//                     isSelected: [_isSelected[index]],
//                     onPressed: (int newIndex) {
//                       setState(() {
//                         _isSelected[index] = true;
//                         for (int i = 0; i < 7; i++) {
//                           if (i != index) {
//                             _isSelected[i] = false;
//                           }
//                         }
//                       });
//
//                       print(index);
//                     },
//                     children: [job[index]],
//                   ),
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (c) => Region()));
//               },
//               child: Text("다음으로"))
//         ],
//       ),
//     );
//   }
// }
//
// var profileFixTitle = Column(
//   children: [
//     Container(
//       child: const Text("프로필을 수정하고 싶군요!"),
//     ),
//     Container(
//       child: const Text("어떤일로"),
//     ),
//     Container(
//       child: const Text("바꿔 드릴까요?"),
//     )
//   ],
// );
//
