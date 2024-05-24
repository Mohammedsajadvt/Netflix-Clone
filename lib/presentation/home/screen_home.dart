import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/FirstPartHomeScreen.dart';
import 'package:netflix/presentation/home/widgets/main_card.dart';
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
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
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
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Popular on Netflix"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Trending Now"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/y3AeW200hqGLxoPyHMDHpzudylz.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Top 10 in Nigeria Today"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/6muOqoxmcR1AzHhiKaPUfvvpCIq.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "My List"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "African Movies"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/mgKwYismEnFI8DHNrZFS9rzm3d2.jpg",
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "Nollywood Movies & TV"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/e1J2oNzSBdou01sUvriVuoYp0pJ.jpg",
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
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/tSz1qsmSJon0rqjHBxXZmrotuse.jpg",
                ),
       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "New Releases"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/yutiEZ7taGDNau2jGjKIdDwQpDw.jpg",
                ),

       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "TV Thrillers & Mysteries"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w220_and_h330_face/nBVYp2xxx2R02n21EGlDky8CgWR.jpg",
                ),
       const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: MainTitle(title: "US TV Shows"),
                ),
                const MainCard(
                  image: "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/yHy0369g2KaO40D4bqzMwkSbjeC.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
