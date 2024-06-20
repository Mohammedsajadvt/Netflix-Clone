import 'package:flutter/material.dart';
import 'package:netflix/domain/core/constant_values.dart';

class ScreenUser extends StatelessWidget {
  const ScreenUser({super.key});

  final List<Map<String, String>> profiles = const [
    {'image': 'images/Emenalo.png', 'name': 'Emenalo'},
    {'image': 'images/Onyeka.png', 'name': 'Onyeka'},
    {'image': 'images/Thelma.png', 'name': 'Thelma'},
    {'image': 'images/Kids.png', 'name': 'Kids'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width / 9),
                Expanded(child: Image.asset('images/netflix.png')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: profiles.length + 1, 
                    itemBuilder: (context, index) {
                      if (index < profiles.length) {
                        return GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.asset(profiles[index]['image']!),
                              Text(profiles[index]['name']!),
                            ],
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          child: Column(
                            children: [
                              addIcon,
                              const SizedBox(height: height20),
                              const Text('Add Profile'),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
