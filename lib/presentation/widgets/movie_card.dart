import 'package:flutter/material.dart';
import 'package:netflix/Common/utils.dart';
import 'package:netflix/core/constant_values.dart'; 
import 'package:netflix/data/model/MovieModel.dart'; 
import 'package:netflix/presentation/widgets/main_title.dart';

class MovieCard extends StatelessWidget {
  final Future<MovieModel> future;
  final String headline;

  const MovieCard({super.key, required this.future, required this.headline});

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
          var data = snapshot.data!.results;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: height20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MainTitle(title: headline),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('$imageUrl${data[index].posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
