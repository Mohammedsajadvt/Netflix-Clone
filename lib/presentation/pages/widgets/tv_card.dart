import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/tv/tv_shows_bloc.dart'; 
import 'package:netflix/domain/core/constant_values.dart';
import 'package:netflix/domain/core/utils.dart';
import 'package:netflix/presentation/pages/widgets/main_title.dart';
import 'package:netflix/presentation/pages/widgets/movie_details_screen.dart';


class TvCard extends StatelessWidget {
  final TvShowsEvent event;
  final String headline;

  const TvCard({super.key, required this.event, required this.headline});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>TvShowsBloc()..add(event),child: BlocBuilder<TvShowsBloc,TvShowsState>(builder: (context,state){
      if(state is TvShowsLoading){
       return Container();
      }else if(state is TvShowError){
        return Center(child: Text('Erroe:${state.message}'),);
      }
      else if(state is TvShowsLoaded){
        var data = state.show;
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
                      child: InkWell(
                        onTap: (){
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ));

                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('$imageUrl${data[index].posterPath}'),
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
    }
    ),);
  }
}


