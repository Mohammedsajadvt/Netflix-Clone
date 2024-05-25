import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CupertinoSearchTextField(),
          
        ],
      ),
    );
  }
}