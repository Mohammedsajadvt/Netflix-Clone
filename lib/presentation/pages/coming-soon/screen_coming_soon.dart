import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/coming%20soon/coming_soon_bloc.dart';
import 'package:netflix/application/coming%20soon/coming_soon_event.dart';
import 'package:netflix/application/coming%20soon/coming_soon_state.dart';
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/domain/core/utils.dart';
import 'package:netflix/infrastructure/model/movie_details_model.dart';
import '../../../infrastructure/service/api_service.dart';

class ScreenComingSoon extends StatelessWidget {
  const ScreenComingSoon({super.key});

  String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM-dd-yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ComingSoonBloc(ApiServices())..add(FetchComingSoonMovies()),
      child: Scaffold(
        body: BlocBuilder<ComingSoonBloc, ComingSoonState>(
          builder: (context, state) {
            if (state is ComingSoonLoading) {
              return const SizedBox();
            } else if (state is ComingSoonError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is ComingSoonLoaded) {
              if (state.movies.results.isEmpty) {
                return const Center(child: Text('No Data Available'));
              } else {
                return ListView.builder(
                  itemCount: state.movies.results.length,
                  itemBuilder: (context, index) {
                    var data = state.movies.results[index];

                    return FutureBuilder<MovieDetailModel>(
                      future: ApiServices().getMovieDetail(data.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: SizedBox());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (snapshot.hasData) {
                          final movieDetail = snapshot.data!;
                          final genreText = movieDetail.genres
                              .map((genre) => genre.name)
                              .join(' . ');

                          return Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '$imageUrl${data.backdropPath}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: height20),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.notifications),
                                      Text('Remind Me'),
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Icon(Icons.share),
                                      Text('Share'),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(formatDate('${data.releaseDate}'),style: TextStyle(color: grey),),
                                    const SizedBox(height: 5),
                                    Text(data.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 5),
                                    Text(
                                      data.overview,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: grey)
                                    ),
                                    const SizedBox(height: height10),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(genreText),
                                ],
                              ),
                              const SizedBox(height: height10),
                            ],
                          );
                        } else {
                          return const Center(
                              child: Text('Movie details not available'));
                        }
                      },
                    );
                  },
                );
              }
            } else {
              return const Center(child: SizedBox());
            }
          },
        ),
      ),
    );
  }
}
