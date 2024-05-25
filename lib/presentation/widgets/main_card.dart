
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    this.previews,
    this.africanMovies,
    this.continueWatchingForEmenalo,
    this.myList,
    this.netflixOriginals,
    this.newReleases,
    this.nollyWoodMoviesandTv,
    this.popularOnNetflix,
    this.topTenInNigeriaToday,
    this.trendingNow,
    this.tvThrillersandMysteries,
    this.usTvShows,
    this.watchItAgain
  });
  final String? previews; 
  final String? continueWatchingForEmenalo;
  final String? popularOnNetflix;
  final String? trendingNow;   
  final String? topTenInNigeriaToday; 
  final String? myList;
  final String? africanMovies; 
  final String? nollyWoodMoviesandTv; 
  final String? netflixOriginals;
  final String? watchItAgain;
  final String? newReleases;
  final String? tvThrillersandMysteries;
  final String? usTvShows;  

   
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
                  ''
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
