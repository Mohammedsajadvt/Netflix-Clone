import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/movie%20detail/movie_detail_event.dart';
import 'package:netflix/application/movie%20detail/movie_detail_state.dart';
import 'package:netflix/infrastructure/service/api_service.dart';


class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final ApiServices apiServices;

  MovieDetailBloc(this.apiServices) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
  }

  void _onFetchMovieDetail(FetchMovieDetail event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());
    try {
      final movieDetail = await apiServices.getMovieDetail(event.movieId);
      emit(MovieDetailLoaded(movieDetail));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }
}
