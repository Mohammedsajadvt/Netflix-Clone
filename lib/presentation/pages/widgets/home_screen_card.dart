import 'package:flutter/material.dart';
import 'package:netflix/domain/core/constant_values.dart';

class FirstPartHomeScreen extends StatelessWidget {
  const FirstPartHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset(
              'images/del.png',
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/n.png'),
                const SizedBox(
                  width: width20,
                ),
                const Text(
                  'Tv Shows',
                  style: TextStyle(fontSize: size20),
                ),
                const SizedBox(
                  width: width20,
                ),
                const Text(
                  'Movies',
                  style: TextStyle(fontSize: size20),
                ),
                const SizedBox(
                  width: width20,
                ),
                const Text(
                  'My List',
                  style: TextStyle(fontSize: size20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
              ],
            ),
          ),
        ),
        const Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '#2 in Nigeria Today',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )))
      ],
    );
  }
}
