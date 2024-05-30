import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/infrastructure/model/search_model.dart';
import 'package:netflix/infrastructure/service/api_service.dart';

import '../../infrastructure/model/movie_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiServices apiServices;

  SearchBloc(this.apiServices) : super(SearchInitial()) {
    on<PerformSearch>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchResults = await apiServices.getSearchMovie(event.query);
        emit(SearchLoaded(searchResults));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });

    on<LoadPopularMoviesEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        final popularMovies = await apiServices.getPopularMovies();
        emit(PopularMoviesLoaded(popularMovies));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
