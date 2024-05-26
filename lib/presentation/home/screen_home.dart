import 'package:flutter/material.dart';
import 'package:netflix/data/model/MovieModel.dart';
import 'package:netflix/data/service/api_service.dart';
import 'package:netflix/presentation/widgets/FirstPartHomeScreen.dart';
import 'package:netflix/presentation/widgets/movie_card.dart';


class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}



class _ScreenHomeState extends State<ScreenHome> {
   late Future<MovieModel> upcomingfuture;
   ApiServicesUpcomingMovie apiServicesUpcomingMovie = ApiServicesUpcomingMovie();
   late Future<MovieModel> nowplayingfuture;
   ApiServiceNowPlayingMovie apiServiceNowPlayingMovie = ApiServiceNowPlayingMovie();
   late Future<MovieModel> popularfuture;
   ApiServicePopularMovies apiServicePopularMovies = ApiServicePopularMovies();
   late Future<MovieModel>  topratedfuture;
   ApiServiceTopRatedMovie apiServiceTopRatedMovie = ApiServiceTopRatedMovie();
   @override
  void initState() {
  upcomingfuture = apiServicesUpcomingMovie.getUpcomingMovies();  
  nowplayingfuture = apiServiceNowPlayingMovie.getNowPlayingMovie();
  popularfuture = apiServicePopularMovies.getPopularMovies();
  topratedfuture = apiServiceTopRatedMovie.getTopRatedMovie();
  }
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
            SingleChildScrollView(
              child: Column(
                children: [
                MovieCard(future: nowplayingfuture, headline: "Now Playing"),
                MovieCard(future: upcomingfuture, headline: "Upcoming Movies"),
                MovieCard(future: popularfuture, headline: "Popular on Netflix"),
                MovieCard(future: topratedfuture, headline: "Top Rated")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
