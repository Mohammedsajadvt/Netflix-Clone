import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/splash/screen_splash.dart';
import 'package:netflix/presentation/user/screen_user.dart';
import 'package:netflix/presentation/main_page/screen_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/splash",
      routes: {
      "/splash":(context) => const ScreenSplash(),
      "/user":(context) => const ScreenUser(),
      "/home":(context)=> const ScreenHome(),
      "/main":(context)=> const Main(),
      },
    );
  }
}


