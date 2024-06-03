import 'package:flutter/material.dart';
import 'package:netflix/application/movie/movie_event.dart';
import 'package:netflix/presentation/pages/widgets/movie_card.dart';
import '../../../infrastructure/service/api_service.dart';
import '../widgets/home_screen_card.dart';


class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final ApiServices apiServices = ApiServices();

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
                    foregroundColor:  WidgetStateProperty.all(Colors.black),
                    shape:  WidgetStateProperty.all(
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
            SingleChildScrollView(
              child: Column(
                children: [
                  MovieCard(
                      event: LoadNowPlayingMovies(),
                      headline: "Now Playing"),
                  MovieCard(
                      event: LoadUpcomingMovies(),
                      headline: "Upcoming Movies"),
                  MovieCard(
                      event: LoadPopularMovies(),
                      headline: "Popular on Netflix"),
                  MovieCard(
                      event: LoadTopRatedMovies(),
                      headline: "Top Rated"),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
