import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart'; // Ensure this file contains the colors 'search' and 'grey'
import 'package:netflix/presentation/widgets/main_title.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: search,
            ),
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: search, 
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: search), // Change border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: search), // Change border color when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: search), // Change border color when focused
                ),
                prefixIcon: Icon(Icons.search, color: grey), 
                suffixIcon: Icon(Icons.mic, color: grey), 
                hintText: 'Search for a show, movie, genre, etc.',
                hintStyle: TextStyle(color: grey),
              ),
              style: TextStyle(color: grey), 
            ),
          ),
          const SizedBox(height: 10),
          const MainTitle(title: "Top Searches"),
        ],
      ),
    );
  }
}
