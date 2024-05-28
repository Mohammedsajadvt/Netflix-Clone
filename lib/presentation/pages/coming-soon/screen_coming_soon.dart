import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/utils.dart';
import 'package:netflix/core/constant_values.dart';
import 'package:netflix/data/model/movie_model.dart';
import 'package:netflix/data/service/api_service.dart';

class ScreenComingSoon extends StatefulWidget {
  const ScreenComingSoon({super.key});

  @override
  State<ScreenComingSoon> createState() => _ScreenComingSoonState();
}

class _ScreenComingSoonState extends State<ScreenComingSoon> {
  late Future<MovieModel> future;
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    future = apiServices.getUpcomingMovies();
    super.initState();
  }

  String formatDate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMM-dd-yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieModel>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          return const Center(
            child: Text('No Data Available'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.results.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.results;
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16/9,
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
                  SizedBox(height: height10),
                ],
              );
            },
          );
        }
      },
    );
  }
}
