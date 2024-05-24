import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexChangeNotifier,builder: (context, int newIndex, _) {
      return BottomNavigationBar(onTap: (index){
      indexChangeNotifier.value = index;
      },elevation: 0,type: BottomNavigationBarType.fixed,unselectedItemColor: grey,selectedItemColor: white,currentIndex: newIndex,items: [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Search"),
    BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined),label: "Coming Soon"),
    BottomNavigationBarItem(icon: Icon(Icons.download),label: "Downloads"),
     BottomNavigationBarItem(icon: Icon(Icons.menu),label: "More")
    ]);
    },);
  }
  }