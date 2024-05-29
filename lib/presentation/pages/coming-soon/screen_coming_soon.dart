import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/coming%20soon/coming_soon_bloc.dart';
import 'package:netflix/application/coming%20soon/coming_soon_event.dart';
import 'package:netflix/application/coming%20soon/coming_soon_state.dart';
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/domain/core/utils.dart';
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
      create: (context) => ComingSoonBloc(ApiServices())..add(FetchComingSoonMovies()),
      child: Scaffold(
        body: BlocBuilder<ComingSoonBloc, ComingSoonState>(
          builder: (context, state) {
            if (state is ComingSoonLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ComingSoonError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is ComingSoonLoaded) {
              if (state.movies.results.isEmpty) {
                return const Center(child: Text('No Data Available'));
              } else {
                return ListView.builder(
                  itemCount: state.movies.results.length,
                  itemBuilder: (context, index) {
                    var data = state.movies.results;
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('$imageUrl${data[index].backdropPath}'),
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
                              Text(formatDate('${data[index].releaseDate}')),
                              const SizedBox(height: 5),
                              Text(data[index].title),
                              const SizedBox(height: 5),
                              Text(
                                data[index].overview,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: height10),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Steamy'),
                            Text('.'),
                            Text('Soapy'),
                            Text('.'),
                            Text('Slow Burn'),
                            Text('.'),
                            Text('Suspenseful'),
                            Text('.'),
                            Text('Teen'),
                            Text('.'),
                            Text('Mystery'),
                          ],
                        ),
                        const SizedBox(height: height10),
                      ],
                    );
                  },
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
