import 'package:netflix/application/bottom%20navigation/bottom_navigation_bloc.dart';
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
          create: (context) =>
              ComingSoonBloc(ApiServices())..add(FetchComingSoonMovies()),
        ),
        BlocProvider(
          create: (context) => MovieDetailBloc(ApiServices()),
        ),
        BlocProvider(
          create: (context) => MovieRecommendationBloc(ApiServices()),
        ),
        BlocProvider(create: (context) => BottomNavigationBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NetFlix Clone',
        theme: ThemeData.dark(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const SplashScreen(),
          "/user": (context) => const UserScreen(),
          "/home": (context) => const HomeScreen(),
          "/search": (context) => const SearchScreen(),
          "/main":(context) => const BottomNavigation()
        },
      ),
    );
  }
}
