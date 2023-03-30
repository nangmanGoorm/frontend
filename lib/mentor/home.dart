





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
import 'package:goorm/mentor/region_setting.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          // Positioned.fill(
          //   child: SvgPicture.asset(
          //     'assets/images/BGdriftbottle_with_bottle.svg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // ClipRRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: const Color(0xff1A1A1B).withOpacity(0.64),
          //       alignment: Alignment.center,
          //       child: const Text(''),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 68),
                Text("선배이시군요",style: MyTextStyle.CgS16W500),
                const SizedBox(height: 9),
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
      '어떤일을\n하고계신가요?',
      style: MyTextStyle.CbS28W700,
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
    List<SvgPicture> categoryImage = [
      SvgPicture.asset(
          'assets/images/IconFarmGrey.svg'),
      SvgPicture.asset(
          'assets/images/IconFishGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconCafeGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconHouseGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconRestaurantGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconSelectshopGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconFreelancerGray700.svg'),
      SvgPicture.asset(
          'assets/images/IconDistributionGray700.svg')
    ];
    List<SvgPicture> unSelectedCategoryImage = [
      SvgPicture.asset(
          'assets/images/IconFarmBlue.svg'),
      SvgPicture.asset(
          'assets/images/IconFishBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconCafeBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconHouseBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconRestaurantBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconSelectshopBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconFreelancerBlue500.svg'),
      SvgPicture.asset(
          'assets/images/IconDistributionBlue500.svg')
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
                ? MyButtonStyle.jobSelectButtonEnabled
                : MyButtonStyle.jobUnSelectButtonEnabled,
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
                  selectedCategory == index
                      ? unSelectedCategoryImage[index]
                      : categoryImage[index]
                  ,
                  selectedCategory == index
                      ? Text(
                    categoryList[index],
                    style: MyTextStyle.CblueS16W600,
                  )
                      : Text(
                    categoryList[index],
                    style: MyTextStyle.CbS16W600,
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
                builder: (context) => const Region()),
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
//
// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(20.0, 36.0, 226.0, 9.0),
//                 child: const Text("제주선배이시군요!"),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(20.0, 0.0, 173.0, 33.0),
//                 child: Text("어떤일을\n하고 계신가요?", style: MyTextStyle.CbS28W700),
//               ),
//             ],
//           ),Column(
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
//
//           Container(
//             margin: EdgeInsets.fromLTRB(20, 0, 20.0, 20.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: 54,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (c) => Region()));
//                 },
//                 style: MyButtonStyle.nextButtonStyle,
//                 child: Text(
//                   '시작하기',
//                   style: MyTextStyle.CwS18W700,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class Region extends StatelessWidget {
//   const Region({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(20, 36.0, 109.0, 66.0),
//             child: Text("제주의 어느 지역에서\n활동하시나요?", style: MyTextStyle.CbS28W700),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(20, 0.0, 20.0, 0.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: '예) 애월',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (String value) {
//                 print('현재 입력된 값: $value');
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(20, 410, 20.0, 20.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: 54,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (c) =>
//                   SeaBottleScreen()));
//                 },
//                 style: MyButtonStyle.nextButtonStyle,
//                 child: Text(
//                   '시작하기',
//                   style: MyTextStyle.CwS18W700,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
