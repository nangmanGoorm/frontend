import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottleDetail extends StatelessWidget {
  const MyBottleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: SvgPicture.asset(
      'assets/images/myarticlelist.svg',
      fit: BoxFit.cover,
    ));
  }
}
