import 'package:flutter/material.dart';
import 'package:netflix/data/model/nowplaying_model.dart';
import 'package:netflix/data/model/upcoming_model.dart';
import 'package:netflix/data/service/Upcoming.dart';
import 'package:netflix/data/service/nowplaying.dart';
import 'package:netflix/presentation/widgets/FirstPartHomeScreen.dart';
import 'package:netflix/presentation/widgets/nowplaying.dart';
import 'package:netflix/presentation/widgets/upcomingmovie.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}



class _ScreenHomeState extends State<ScreenHome> {
   late Future<UpcomingMovieModel> upcomingfuture;
   ApiServicesUpcomingMovie apiServicesUpcomingMovie = ApiServicesUpcomingMovie();
   late Future<NowPlayingMovieModel> nowplayingfuture;
   ApiServiceNowPlayingMovie apiServiceNowPlayingMovie = ApiServiceNowPlayingMovie();
   @override
  void initState() {
  upcomingfuture = apiServicesUpcomingMovie.getUpcomingMovies();  
  nowplayingfuture = apiServiceNowPlayingMovie.getNowPlayingMovie();
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
                  NowPlayingMovieWidget(future: nowplayingfuture, headline: "Now Playing"),
                  MovieCardWidget(future: upcomingfuture, headline: "Upcoming Movies"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
