import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: Image.asset('images/n.png'),
      actions: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Text('Tv Shows'),
         Text('Movies'),
         Text('My List')
          ],
        ),
      )
      ],
    ),);
  }
}