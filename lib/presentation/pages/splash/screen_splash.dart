import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),()=> Navigator.pushReplacementNamed(context,'/user'));
    return SizedBox(
      
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Lottie.network('https://assets1.lottiefiles.com/private_files/lf30_is6flrfu.json',fit: BoxFit.contain,repeat: false,frameRate:const FrameRate(40) ),
    
    );
  }
}
