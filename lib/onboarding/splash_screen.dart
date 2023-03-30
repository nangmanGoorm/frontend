import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  void initState() {
    // _navigateToMainApp();
  }

// void _navigateToMainApp() async {
//     await Future.delayed(const Duration(milliseconds: 2000), () {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => const LoopcycleMainApp()));
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Text('splash screen입니다.');
  }
}
