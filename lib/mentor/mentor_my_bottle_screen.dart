import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentor/mentor_bottle.dart';
import 'package:goorm/mentor/mentor_more_detail.dart';
import 'package:goorm/models/answer_model.dart';
import 'package:goorm/models/bottle_model.dart';
import 'package:goorm/models/user_model.dart';

class MentorMyBottleScreen extends StatefulWidget {
  const MentorMyBottleScreen({super.key});

  @override
  State<MentorMyBottleScreen> createState() => _MentorMyBottleScreenState();
}

class _MentorMyBottleScreenState extends State<MentorMyBottleScreen> {
  num? selectedBottleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('도움을 기다리는 제주 후배', style: MyTextStyle.CwS18W700),
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
                selectedBottleId != null
                    ? _bottleDetail(selectedBottleId!)
                    : _selectButtons(),
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
        'category': 0,
       'createdAt': DateTime.now().toString(),
        'message': '어릴 때부터 게스트 하우스 차리는 게 꿈이었어요 자본금 5000만원을 모았는데 이 돈으로 게하 창업 가능할까요? 간절합니다 도와주세요 애월에 차리고 싶어요',
        'offer': 0
      },
      {
        'category': 1,
        'createdAt': DateTime.now().toString(),
        'message': '제주 게하 스텝 2년차입니다! 이제 스텝은 그만하고 제 게하를 차리고 싶은데 사장님께서 게하 운영 비법은 꽁꽁 숨기고 안 알려주시네요ㅜㅜ 제 꿈을 이룰 수 있게 도와주세요',
        'offer': 1
      },
      {
        'category': 2,
        'createdAt': DateTime.now().toString(),
        'message': '게스트 하우스 운영이 재밌어보여 무작정 적금 들고 제주로 내려왔네요 그런데 지금 빚만 2억이에요 어떻게 해야 게하로 수익을 낼 수 있을까요?',
        'offer': 3
      },
      {
        'category': 3,
        'createdAt': DateTime.now().toString(),
        'message': '이번이 진짜 마지막이다! 라는 심정으로 쪽지 보냅니다 게하 사장이라는 꿈만 가지고 2년 째 적자를 버티고 있어요 이대로라면 우리 가족 굶어 죽어요',
        'offer': 3
      },
    ]; //TODO: 여기 땡겨와야 함
    //TODO: 제안 받은것도 따로 땡겨와야 함

    return Container(
      width: double.maxFinite,
      height: 700,
      alignment: Alignment.topCenter,
      child: ListView.separated(
        itemCount: myBottles.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: MyColors.gray900,
        ),
        itemBuilder: (context, index) {
          MentorBottle bottleModel = MentorBottle.fromJson(myBottles[index]);
          return TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MentorHelpMoreDetailScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.maxFinite,
              height: 140,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/avatar.svg',
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
                      Container(
                        margin: EdgeInsets.only(top: 1.0,bottom: 1.0),
                        padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
                        child: Text("숙박업",style: MyTextStyle.jobText,),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            bottleModel.createdAt.toString(),
                            style: MyTextStyle.CgS12W500,
                          ),
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
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 221,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 68),
              Text(
                bottleModel.category!,
                // selectedBottleId.toString(),
                style: MyTextStyle.CwS28W700,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    bottleModel.createdAt.toString(),
                    style: MyTextStyle.CgS14W500,
                  ),
                  Text(' | ', style: MyTextStyle.CgS14W500),
                  Text('제안 ${bottleModel.offer}개', style: MyTextStyle.CgS14W500)
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.maxFinite,
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
        ),
        const SizedBox(height: 24),
        ListView.separated(
          // itemCount: answerModelList.length,
          itemCount: 2,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: MyColors.gray900,
          ),
          itemBuilder: (context, index) {
            return Text(
              index.toString(),
              style: TextStyle(color: Colors.red),
            );
            // Answer answerModel = Answer.fromJson(answerModelList[index]);
            // // User userModel = User.fromJson(userModelList[index]);
            // //TODO: answermodel의 user_id가지고 연결해야함
            // // return mentorComments(answerModel);
            // return Container(
            //   width: 100,
            //   height: 100,
            //   decoration: BoxDecoration(color: Colors.white),
            // );
          },
        ),
      ],
    );
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
