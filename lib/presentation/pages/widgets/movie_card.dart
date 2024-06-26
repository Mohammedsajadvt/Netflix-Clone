import'index.dart';

class MovieCard extends StatelessWidget {
  final String headline;
  final MovieEvent event;

  const MovieCard({super.key, required this.headline, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(ApiServices())..add(event),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Container();
          } else if (state is MovieError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is MovieLoaded) {
            var data = state.movies;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: height20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MainTitle(title: headline),
                ),
                const SizedBox(height: 10),
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movieId: data[index].id)));
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '$imageUrl${data[index].posterPath}'),
                                fit: BoxFit.cover,
                              ),
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
          return const SizedBox();
        },
      ),
    );
  }
}
