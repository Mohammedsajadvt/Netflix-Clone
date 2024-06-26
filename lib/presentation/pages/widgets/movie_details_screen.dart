import 'index.dart';

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
                    child: SizedBox()
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MainTitle(title: 'More Like This'),
                BlocBuilder<MovieRecommendationBloc, MovieRecommendationState>(
                  builder: (context, state) {
                    if (state is MovieRecommendationLoading) {
                      return  Center(
                        child: Container(),
                      );
                    } else if (state is MovieRecommendationError) {
                      return Center(
                        child: Text('Error: ${state.message}'),
                      );
                    } else if (state is MovieRecommendationLoaded) {
                      final movieRecommendations = state.movieRecommendations;
                      if (movieRecommendations.results.isEmpty) {
                        return Container();
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
          ],
        ),
      ),
    );
  }
}
