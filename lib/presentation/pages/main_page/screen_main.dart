import 'package:flutter/material.dart';
import 'package:netflix/presentation/coming-soon/screen_coming_soon.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/more/screen_more.dart';
import 'package:netflix/presentation/search/screen_search.dart';
import 'package:netflix/presentation/widgets/bottom_navigation.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  final pages = const [
    ScreenHome(),
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
