import 'package:netflix/application/bottom%20navigation/bottom_navigation_bloc.dart';

import 'index.dart';

List<BottomNavigationBarItem> bottomNavIteams = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: "Search",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.photo_library_outlined),
    label: "Coming Soon",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.download_rounded),
    label: "Downloads",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: "More",
  ),
];

const List<Widget> bottomNavScreens = <Widget> [
    HomeScreen(),
    SearchScreen(),
    ScreenComingSoon(),
    ScreenDownloads(),
    ScreenMore()
  ];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(builder: (context,state){
      return Scaffold(
      body: Center(child: bottomNavScreens.elementAt(state.tabIndex),),
      bottomNavigationBar: BottomNavigationBar(items: bottomNavIteams,elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: grey,
          selectedItemColor: white,
          currentIndex: state.tabIndex,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: (index){
           BlocProvider.of<BottomNavigationBloc>(context).add(Tabchange(tabIndex: index));
          },
          ),
          
      );
    }, listener: (context,state){});
  }
}
