import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/my_bottle_detail.dart';
import 'package:goorm/models/answer_model.dart';
import 'package:goorm/models/bottle_model.dart';
import 'package:goorm/models/user_model.dart';

class MyBottleScreen extends StatefulWidget {
  const MyBottleScreen({super.key});

  @override
  State<MyBottleScreen> createState() => _MyBottleScreenState();
}

class _MyBottleScreenState extends State<MyBottleScreen> {
  num? selectedBottleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('내가 보낸 해류병', style: MyTextStyle.CwS18W700),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.white,
          ),
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
                // selectedBottleId != null
                //     ? _bottleDetail(selectedBottleId!)
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
    //TODO: category 개수도 여기서 잡아서 넣기
    List<Map<String, dynamic>> myBottles = [
      {
        'category': 2,
        'createdAt': DateTime.now().toString(),
        'message': '안녕하세요 제주살이 새내기입니다. 시작할 때 어떤 것부터 시작할지 잘 모르겠어요. adsf',
        'offer': 1
      },
    ]; //TODO: 여기 땡겨와야 함
    //TODO: 제안 받은것도 따로 땡겨와야 함

    return Container(
      width: double.maxFinite,
      height: 600,
      alignment: Alignment.topCenter,
      child: ListView.separated(
        itemCount: myBottles.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: MyColors.gray900,
        ),
        itemBuilder: (context, index) {
          Bottle bottleModel = Bottle.fromJson(myBottles[index]);
          return TextButton(
            onPressed: () {
              // setState(() {
              //   selectedBottleId = index;
              // });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyBottleDetail(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.maxFinite,
              height: 122,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    bottleModel.offer! > 0
                        ? 'assets/images/selected_request.svg'
                        : 'assets/images/unselected_request.svg',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bottleModel.category!,
                        style: MyTextStyle.CwS18W700,
                      ),
                      Row(
                        children: [
                          Text(
                            bottleModel.createdAt.toString(),
                            style: MyTextStyle.CgS12W500,
                          ),
                          Text(' | ', style: MyTextStyle.CgS12W500),
                          Text('제안 ${bottleModel.offer}개',
                              style: MyTextStyle.CgS12W500)
                        ],
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          bottleModel.message!,
                          maxLines: 2,
                          softWrap: false,
                          style: MyTextStyle.listBuilderText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: MyColors.white,
                    size: 18,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bottleDetail(num bottleId) {
    Map<String, dynamic> bottleModelMap = {
      'category': 0,
      'createdAt': DateTime.now().toString(),
      'message': '안녕하세요 제주살이 새내기입니다. 시작할 때 어떤 것부터 시작할지 잘 모르겠어요. adsf',
      'offer': 0
    };
    List<Map<String, dynamic>> answerModelList = [
      {
        'id': 123,
        'user_id': 123,
        'bottle_id': 1234,
        'messages': '헿헤ㅔ엔ㅁ아문움너ㅜ어ㅏㅁ눠ㅏ우ㅏ머누ㅏㅓ루ㅏㅓㅇ눠ㅏㅜㄴ아ㅓ후ㅏㄴ어ㅜ라ㅓㅇ누ㅏㅓ루나어ㅜ라ㅜㄴ아ㅓ루나',
      },
      {
        'id': 124,
        'user_id': 123,
        'bottle_id': 1234,
        'messages': '헿헤ㅔ엔ㅁ아문움너ㅜ어ㅏㅁ눠ㅏ우ㅏ머누ㅏㅓ루ㅏㅓㅇ눠ㅏㅜㄴ아ㅓ후ㅏㄴ어ㅜ라ㅓㅇ누ㅏㅓ루나어ㅜ라ㅜㄴ아ㅓ루나',
      },
      {
        'id': 125,
        'user_id': 123,
        'bottle_id': 1234,
        'messages': '헿헤ㅔ엔ㅁ아문움너ㅜ어ㅏㅁ눠ㅏ우ㅏ머누ㅏㅓ루ㅏㅓㅇ눠ㅏㅜㄴ아ㅓ후ㅏㄴ어ㅜ라ㅓㅇ누ㅏㅓ루나어ㅜ라ㅜㄴ아ㅓ루나',
      }
    ];

    Bottle bottleModel = Bottle.fromJson(bottleModelMap);
    // Answer answerModel = Answer.fromJson(answerModelMap);
    // return Column(
    //   children: [
    //     SizedBox(
    //       width: double.maxFinite,
    //       height: 221,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 68),
    //           Text(
    //             bottleModel.category!,
    //             // selectedBottleId.toString(),
    //             style: MyTextStyle.CwS28W700,
    //           ),
    //           const SizedBox(height: 8),
    //           Row(
    //             children: [
    //               Text(
    //                 bottleModel.createdAt.toString(),
    //                 style: MyTextStyle.CgS14W500,
    //               ),
    //               Text(' | ', style: MyTextStyle.CgS14W500),
    //               Text('제안 ${bottleModel.offer}개', style: MyTextStyle.CgS14W500)
    //             ],
    //           ),
    //           const SizedBox(height: 8),
    //           SizedBox(
    //             width: double.maxFinite,
    //             child: Text(
    //               bottleModel.message!,
    //               maxLines: 2,
    //               softWrap: false,
    //               style: MyTextStyle.listBuilderText,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     const SizedBox(height: 24),
    //     ListView.separated(
    //       // itemCount: answerModelList.length,
    //       itemCount: 2,
    //       separatorBuilder: (context, index) => Divider(
    //         height: 1,
    //         color: MyColors.gray900,
    //       ),
    //       itemBuilder: (context, index) {
    //         return Text(
    //           index.toString(),
    //           style: TextStyle(color: Colors.red),
    //         );
    //         // Answer answerModel = Answer.fromJson(answerModelList[index]);
    //         // // User userModel = User.fromJson(userModelList[index]);
    //         // //TODO: answermodel의 user_id가지고 연결해야함
    //         // // return mentorComments(answerModel);
    //         // return Container(
    //         //   width: 100,
    //         //   height: 100,
    //         //   decoration: BoxDecoration(color: Colors.white),
    //         // );
    //       },
    //     ),
    //   ],
    // );
    return SvgPicture.asset('assets/images/myarticlelist.svg');
  }

  Widget mentorComments(answerModel) {
    List<Map<String, dynamic>> userModelList = [
      {
        'id': 123,
        'nickname': 'jaewontop',
        'type': '선배',
        'location': '애월',
        'category': '카페',
      },
      {
        'id': 124,
        'nickname': 'asdasdasd',
        'type': '선배',
        'location': '애월',
        'category': '카페',
      },
      {
        'id': 125,
        'nickname': '223r2ass',
        'type': '선배',
        'location': '애월',
        'category': '카페',
      },
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: 100,
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SvgPicture.asset(
          //   'assets/images/avatar.svg',
          //   fit: BoxFit.cover,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // userModel.nickname!,
                '홍길동',
                style: MyTextStyle.CwS18W700,
              ),
              // Row(
              //   children: [_tag('숙박업'), _tag('애월')],
              // ),
              // Text('2023.03.20', style: MyTextStyle.CgS12W500),
              // SizedBox(
              //   width: 268,
              //   child: Text(
              //     '전 서귀포 파티 게하 10년차 도민입니다. 제 10년 노하우를 전달해드리도록 하겠습니다. 연락주세요 :)',
              //     style: MyTextStyle.listBuilderText,
              //   ),
              // ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: MyColors.white,
            size: 18,
          )
        ],
      ),
    );
  }

  Widget _tag(String tagName) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.white),
      ),
      margin: const EdgeInsets.only(right: 4),
      child: Text(
        tagName,
        style: MyTextStyle.CwS12W500,
      ),
    );
  }
}
