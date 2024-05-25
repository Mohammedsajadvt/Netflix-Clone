import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/FirstPartHomeScreen.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             const FirstPartHomeScreen(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                    const Text('My List'),
                  ],
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    foregroundColor: WidgetStateProperty.all(Colors.black),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  label: const Text('Play'),
                  icon: const Icon(Icons.play_arrow),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline),
                    ),
                    const Text('Info'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Previews"),
                ),
                LimitedBox(
                  maxHeight: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipOval(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/z54kt8s5OsRooCWBMT2Df4q61BZ.jpg'
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Continue Watching for Emenalo"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Popular on Netflix"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Trending Now"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Top 10 in Nigeria Today"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "My List"),
                ),
                const MainCard(
                 
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "African Movies"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Nollywood Movies & TV"),
                ),
                const MainCard(
                  
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Netflix Originals"),
                ),
                 LimitedBox(
             maxHeight: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 170,
            height: 250,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://media.themoviedb.org/t/p/w220_and_h330_face/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
      ),
    ),
     const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Watch It Again"),
                ),
                const MainCard(
               
                ),
       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "New Releases"),
                ),
                const MainCard(
                 
                ),

       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "TV Thrillers & Mysteries"),
                ),
                const MainCard(
                  
                ),
       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "US TV Shows"),
                ),
                const MainCard(
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
