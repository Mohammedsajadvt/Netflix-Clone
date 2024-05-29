import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/movie/movie_bloc.dart';
import 'package:netflix/data/service/api_service.dart';
import 'package:netflix/presentation/pages/home/screen_home.dart';
import 'package:netflix/presentation/pages/main_page/screen_main.dart';
import 'package:netflix/presentation/pages/search/screen_search.dart';
import 'package:netflix/presentation/pages/splash/screen_splash.dart';
import 'package:netflix/presentation/pages/user/screen_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(ApiServices()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const ScreenSplash(),
          "/user": (context) => const ScreenUser(),
          "/home": (context) => const ScreenHome(),
          "/main": (context) => const Main(),
          "/search": (context) => const ScreenSearch(),
        },
      ),
    );
  }
}
