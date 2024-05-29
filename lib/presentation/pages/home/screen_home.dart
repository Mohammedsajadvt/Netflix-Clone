import 'package:flutter/material.dart';
import 'package:netflix/data/model/movie_model.dart';
import 'package:netflix/data/model/tvseries_model.dart';
import 'package:netflix/data/service/api_service.dart';
import 'package:netflix/presentation/pages/widgets/home_screen_card.dart';
import 'package:netflix/presentation/pages/widgets/movie_card.dart';
import 'package:netflix/presentation/pages/widgets/tv_card.dart';



class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}



class _ScreenHomeState extends State<ScreenHome> {
   late Future<MovieModel> upcomingfuture;
   ApiServices apiServices = ApiServices();
   late Future<MovieModel> nowplayingfuture;
   late Future<MovieModel> popularfuture;
   late Future<MovieModel>  topratedfuture;
   late Future<TvSeries> airingtodayfuture;
   late Future<TvSeries> ontheAirfuture;
   late Future<TvSeries> popularSeriesfuture;
   late Future<TvSeries> topRatedSeriresfuture;
  
   @override
  void initState() {
  upcomingfuture = apiServices.getUpcomingMovies();  
  nowplayingfuture =  apiServices.getNowPlayingMovie();
  popularfuture =  apiServices.getPopularMovies();
  topratedfuture =  apiServices.getTopRatedMovie();
  airingtodayfuture = apiServices.getAiringToday();
  ontheAirfuture = apiServices.getOnTheAir();
  popularSeriesfuture = apiServices.getPopular();
  topRatedSeriresfuture = apiServices.getTopRated();
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
                MovieCard(future: topratedfuture, headline: "Top Rated"),
                TvCard(future: airingtodayfuture, headline: "Airing Today"),
                TvCard(future: ontheAirfuture, headline: "On The Hair"),
                TvCard(future: popularSeriesfuture, headline: "Popular"),
                TvCard(future: topRatedSeriresfuture, headline: "Top Rated"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
