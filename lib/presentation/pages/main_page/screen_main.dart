import 'package:flutter/material.dart';
import 'package:netflix/presentation/pages/coming-soon/screen_coming_soon.dart';
import 'package:netflix/presentation/pages/downloads/screen_downloads.dart';
import 'package:netflix/presentation/pages/home/home_screen.dart';
import 'package:netflix/presentation/pages/more/screen_more.dart';
import 'package:netflix/presentation/pages/search/screen_search.dart';
import 'package:netflix/presentation/pages/widgets/bottom_navigation.dart';


class Main extends StatelessWidget {
  const Main({super.key});

  final pages = const [
    HomeScreen(),
    ScreenSearch(),
    ScreenComingSoon(),
    ScreenDownloads(),
    ScreenMore()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, index, child) {
        return pages[index];
      },),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

