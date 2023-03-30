import 'package:flutter/material.dart';
import 'package:goorm/consts/button_style.dart';
import 'package:goorm/consts/text_style.dart';

class NextButtonWidget extends StatelessWidget {
  final Future<dynamic>? buttonAction;
  const NextButtonWidget({super.key, required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        buttonAction;
      },
      style: MyButtonStyle.nextButtonStyle,
      child: Text(
        '다음으로',
        style: MyTextStyle.CbS18W700,
      ),
    );
  }
}
