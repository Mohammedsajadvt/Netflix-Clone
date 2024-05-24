
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.image
  });

  final String image; 

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 120,
            height: 120,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
