

import '../widgets/index.dart';

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
