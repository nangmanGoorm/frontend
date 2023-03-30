import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';
import 'package:goorm/mentee/send_draft_screen.dart';
import 'package:http/http.dart' as http;

class HelpMoreDetailScreen extends StatefulWidget {
  final num selectedCategory;
  const HelpMoreDetailScreen({super.key, required this.selectedCategory});

  @override
  State<HelpMoreDetailScreen> createState() => _HelpMoreDetailScreen();
}

class _HelpMoreDetailScreen extends State<HelpMoreDetailScreen> {
  num? selectedCategory;
  final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   _controller.addListener(_checkIfFieldsFilled);
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //     leading: IconButton(
      //         icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () {

      //       }),
      //     backgroundColor: Colors.transparent),
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
                _textFormField(),
                const Spacer(),
                _nextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleText() {
    return Text(
      '더 자세하게\n알려주세요',
      style: MyTextStyle.CwS28W700,
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: () async {
          // var url = Uri.https(
          //     'http://k8s-jejuseni-alb-8e27d7eb9b-1856798335.ap-northeast-2.elb.amazonaws.com/',
          //     'users/signup');
          // var response =
          //     await http.post(url, body: {
          //       'nickname':
          //     });
          // print(response);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SendDraftScreen()),
          );
        },
        style: MyButtonStyle.nextButtonStyle,
        child: Text(
          '도움 요청하기',
          style: MyTextStyle.CwS18W700,
        ),
      ),
    );
  }

  Widget _textFormField() {
    return SizedBox(
      width: 320,
      height: 142,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: _controller,
        maxLines: 10,
        decoration: const InputDecoration(
          hintText: '예) 안녕하세요 제주살이 새내기입니다. 시작할 때 어떤 것부터 시작할지 잘 모르겠어요.',
        ),
        style: MyTextStyle.CwS16W500,
      ),
    );
  }
}
