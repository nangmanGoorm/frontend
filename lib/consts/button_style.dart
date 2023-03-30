import 'package:flutter/material.dart';
import 'package:goorm/consts/colors.dart';

class MyButtonStyle {
  static ButtonStyle nextButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
    backgroundColor: MaterialStatePropertyAll(MyColors.blue500),
  );

  static ButtonStyle roleSelectButtonEnabled = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(width: 1, color: MyColors.blue500),
      ),
    ),
  );

  static ButtonStyle roleSelectButtonDisabled = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(width: 1, color: MyColors.gray300),
      ),
    ),
  );
}
