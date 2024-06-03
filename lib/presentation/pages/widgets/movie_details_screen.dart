import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netflix/application/movie%20detail/movie_detail_bloc.dart';
import 'package:netflix/application/movie%20detail/movie_detail_event.dart';
import 'package:netflix/application/movie%20detail/movie_detail_state.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_bloc.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_event.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_state.dart';
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/domain/core/utils.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailBloc>().add(FetchMovieDetail(movieId));
    context.read<MovieRecommendationBloc>().add(FetchMovieRecommendation(movieId));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                if (state is MovieDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is MovieDetailError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else if (state is MovieDetailLoaded) {
                  final movie = state.movieDetail;
                  String genreText = movie.genres.map((genre) => genre.name).join(',');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: movie.backdropPath != null
                                  ? NetworkImage("$imageUrl${movie.backdropPath}")
                                  : const AssetImage('images/n.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 20,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Icon(Icons.arrow_back, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title ?? '',
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  movie.releaseDate?.year.toString() ?? '',
                                  style: const TextStyle(color: grey),
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  genreText,
                                  style: const TextStyle(color: grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              movie.overview ?? '',
                              style: const TextStyle(color: white, fontSize: 15),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10,), 
              child: Text(
                "More Like This",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<MovieRecommendationBloc, MovieRecommendationState>(
              builder: (context, state) {
                if (state is MovieRecommendationLoading) {
                  return const Center(
                    child: SizedBox(),
                  );
                } else if (state is MovieRecommendationError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else if (state is MovieRecommendationLoaded) {
                  final movieRecommendations = state.movieRecommendations;
                  if (movieRecommendations.results.isEmpty) {
                    return const SizedBox();
                  }
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.5 / 2,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: movieRecommendations.results.length,
                    itemBuilder: (context, index) {
                      final movie = movieRecommendations.results[index];
                      return CachedNetworkImage(
                        imageUrl: movie.posterPath != null
                          ? "$imageUrl${movie.posterPath}"
                          : 'images/n.png',
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset('images/n.png'),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
