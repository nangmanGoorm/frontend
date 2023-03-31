import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/colors.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/widgets/bottom_navigation_bar.dart';
import 'package:goorm/widgets/white_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.gray100,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              headerLogo(),
              const SizedBox(height: 20),
              recentOffer(),
              const SizedBox(height: 20),
              jejuPolicy(),
              const SizedBox(height: 20),
              jejuSeniors(),
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const WhiteMyBottomNavigationBar(),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: WhiteMyBottomNavigationBar(),
    );
  }

  Widget headerLogo() {
    return SvgPicture.asset('assets/images/goorm_logo.svg');
  }

  Widget recentOffer() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      height: 186,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '🤙🏻 최근 받은 제안',
            style: MyTextStyle.CbS20W700,
          ),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/defaulfImg.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '게하총총 선배',
                    style: MyTextStyle.CbS14W700,
                  )
                ],
              ),
              const SizedBox(height: 14),
              Text(
                '안녕하세요 성산 게하 창업 준비 중이시라니 반갑습니다. 전 성산 토박이입니다~ 몇년전 개인 사정으로 게하 사업은 그만두었어요ㅜㅜ 그래서 더 솔직하고 꾸밈 없이 게하 운영 노하우를 전달 드릴 수 있어요:)',
                style: MyTextStyle.graySmallText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget jejuPolicy() {
    return Container(
      width: double.maxFinite,
      height: 380,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '💸 제주 새내기를 위한 정책',
                  style: MyTextStyle.CbS20W700,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: MyColors.gray500,
                )
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                'assets/images/policyImage.png',
                  width: 72,
                  height: 72,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '제주도 귀농귀촌 지원정책',
                      style: MyTextStyle.CbS18W700,
                    ),
                    Text(
                      '다양한작목의 재배실습 및 마케팅과 ...',
                      style: MyTextStyle.CgS14W500,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/policyImage2.png',
                  width: 72,
                  height: 72,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '[맛있는 땀방울] 제주시 귀농...',
                      style: MyTextStyle.CbS18W700,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '귀농 농업창업 및 주택구입 지원사업...',
                      style: MyTextStyle.CgS14W500,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 72,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/policyImage3.png',
                  width: 72,
                  height: 72,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '귀어 창업 및 주택구입 지원...',
                      style: MyTextStyle.CbS18W700,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '귀어 창업 및 주택구입 지원사업',
                      style: MyTextStyle.CgS14W500,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '더보기',
            style: MyTextStyle.CgS14W500,
          )
        ],
      ),
    );
  }

  Widget jejuSeniors() {
    return Container(
      width: double.maxFinite,
      height: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.02),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xff1A1A1B).withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 32,
            offset: const Offset(16, 16), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '😎 당신을 위한 제주 선배들',
                  style: MyTextStyle.CbS20W700,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: MyColors.gray500,
                )
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/defaulfImg.png',
                  width: 36,
                  height: 36,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '홍제주',
                      style: MyTextStyle.CbS16W700,
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        _tag('숙박업'),
                        const SizedBox(width: 4),
                        _tag('애월')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/defaulfImg.png',
                  width: 36,
                  height: 36,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '한윤범',
                      style: MyTextStyle.CbS16W700,
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        _tag('숙박업'),
                        const SizedBox(width: 4),
                        _tag('제주시')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/defaulfImg.png',
                  width: 36,
                  height: 36,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '제주총총',
                      style: MyTextStyle.CbS16W700,
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        _tag('숙박업'),
                        const SizedBox(width: 4),
                        _tag('성산')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '더보기',
            style: MyTextStyle.CgS14W500,
          )
        ],
      ),
    );
  }

  Widget _tag(String tagName) {
    return Container(
      height: 22,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.gray500),
      ),
      child: Center(
        child: Text(
          tagName,
          style: MyTextStyle.CgS12W500,
        ),
      ),
    );
  }
}
