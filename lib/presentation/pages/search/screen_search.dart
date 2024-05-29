import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/data/model/movie_model.dart';
import 'package:netflix/data/model/search_model.dart';
import 'package:netflix/data/service/api_service.dart';
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/domain/core/utils.dart';
import 'package:netflix/presentation/pages/widgets/main_title.dart';


class ScreenSearch extends StatefulWidget {
  const ScreenSearch({
    super.key,
  });

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController searchController = SearchController();
  ApiServices apiServices = ApiServices();
  late Future<MovieModel> popularMovies;
  SearchModel? searchModel;

  void search(String query) {
    apiServices.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    popularMovies = apiServices.getPopularMovies();
  }

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
                    } else {
                      search(searchController.text);
                    }
                  },
                ),
              ),
              searchController.text.isEmpty
                  ? FutureBuilder<MovieModel>(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.results.isEmpty) {
                          return const Center(
                            child: Text('No Data Available'),
                          );
                        } else {
                          var data = snapshot.data!.results;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: height20,
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: MainTitle(title: "Top Searches"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
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
                                         Image.network('$imageUrl${data[index].posterPath}',),
                                         const SizedBox(width: 20,),
                                         Expanded(child: Text(data[index].title,maxLines: 2,style:const TextStyle(overflow: TextOverflow.ellipsis),)),
                                         IconButton(onPressed: (){}, icon: Icon(Icons.play_circle))
                                       ],
                                     ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                      },
                    )
                  : searchModel == null
                      ? const SizedBox.shrink()
                      : GridView.builder(
                          itemCount: searchModel?.results.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.2 / 2),
                          itemBuilder: (contex, index) {
                            return Column(
                              children: [
                                searchModel!.results[index].backdropPath == null
                                    ? Image.asset(
                                        'images/n.png',
                                        height: 170,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl:
                                            "$imageUrl${searchModel!.results[index].backdropPath}",
                                        height: 170,
                                      ),
                                Text(
                                  searchModel!.results[index].originalTitle,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis),
                                ),
                               
                              ],
                            );
                          }),
            ],
          ),
        ),
      ),
    );
  }
}
