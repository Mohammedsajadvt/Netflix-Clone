import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/user');
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset('images/netflix.json'),
      ),
    );
  }
}
