import 'package:flutter/material.dart';

class SeaBottleScreen extends StatefulWidget {
  const SeaBottleScreen({super.key});

  @override
  State<SeaBottleScreen> createState() => _SeaBottleScreenState();
}

class _SeaBottleScreenState extends State<SeaBottleScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _titleText());
  }

  Widget _titleText() {
    return Text(
      '도움 요청하기',
    );
  }
}
