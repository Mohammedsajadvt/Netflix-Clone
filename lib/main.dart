import 'package:netflix/presentation/pages/widgets/index.dart';

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
        BlocProvider(
          create: (context) => ComingSoonBloc(ApiServices())..add(FetchComingSoonMovies()),
        ),
        BlocProvider(
          create: (context) => MovieDetailBloc(ApiServices()),
        ),
         BlocProvider(
          create: (context) => MovieRecommendationBloc(ApiServices()), 
        ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NetFlix Clone',
        theme: ThemeData.dark(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const ScreenSplash(),
          "/user": (context) => const ScreenUser(),
          "/home": (context) => const HomeScreen(),
          "/main": (context) =>   Main(),
          "/search": (context) => const ScreenSearch(),
        },
      ),
    );
  }
}
