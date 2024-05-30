import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/infrastructure/model/movie_model.dart';
import 'package:netflix/infrastructure/service/api_service.dart';
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/presentation/pages/widgets/main_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../application/search/search_bloc.dart';
import '../../../domain/core/utils.dart';
import '../../../infrastructure/model/search_model.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(ApiServices())
        ..add(LoadPopularMoviesEvent()),
      child: const ScreenSearchView(),
    );
  }
}

class ScreenSearchView extends StatefulWidget {
  const ScreenSearchView({Key? key}) : super(key: key);

  @override
  State<ScreenSearchView> createState() => _ScreenSearchViewState();
}

class _ScreenSearchViewState extends State<ScreenSearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CupertinoSearchTextField(
                  controller: searchController,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: grey,
                  ),
                  style: const TextStyle(color: white),
                  backgroundColor: grey.withOpacity(0.3),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      context.read<SearchBloc>().add(LoadPopularMoviesEvent());
                    } else {
                      context.read<SearchBloc>().add(PerformSearch(value));
                    }
                  },
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchLoaded) {
                    return _buildSearchResults(state.searchResults);
                  } else if (state is PopularMoviesLoaded) {
                    return _buildPopularMovies(state.popularMovies);
                  } else if (state is SearchError) {
                    return Center(child: Text("Error: ${state.message}"));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularMovies(MovieModel movieModel) {
    var data = movieModel.results;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: height20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MainTitle(title: "Top Searches"),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Image.network('$imageUrl${data[index].posterPath}'),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        data[index].title,
                        maxLines: 2,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle))
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSearchResults(SearchModel searchModel) {
    return GridView.builder(
      itemCount: searchModel.results.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 5,
        childAspectRatio: 1.2 / 2,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            searchModel.results[index].backdropPath == null
                ? Image.asset(
              'images/n.png',
              height: 170,
            )
                : CachedNetworkImage(
              imageUrl: "$imageUrl${searchModel.results[index].backdropPath}",
              height: 170,
            ),
            Text(
              searchModel.results[index].originalTitle,
              style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
            ),
          ],
        );
      },
    );
  }
}
