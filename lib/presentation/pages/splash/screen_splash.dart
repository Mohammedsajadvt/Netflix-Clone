import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
   
    super.initState();
     Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/user');
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Lottie.asset('images/netflix.json'),
    );
  }
}
