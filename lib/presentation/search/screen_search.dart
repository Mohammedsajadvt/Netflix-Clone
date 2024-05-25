import 'package:flutter/material.dart';
import 'package:netflix/core/constant_values.dart';
import 'package:netflix/presentation/widgets/maincard.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: lightBlack,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightBlack,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: lightBlack),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lightBlack),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lightBlack),
                  ),
                  prefixIcon: Icon(Icons.search, color: grey),
                  suffixIcon: Icon(Icons.mic, color: grey),
                  hintText: 'Search for a show, movie, genre, etc.',
                  hintStyle: TextStyle(color: grey),
                ),
                style: TextStyle(color: grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MainTitle(title: "Top Searches"),
            ),
          MainCardSearch()
          ],
        ),
      ),
    );
  }
}

