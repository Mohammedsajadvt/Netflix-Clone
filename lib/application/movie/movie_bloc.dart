import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/data/service/api_service.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiServices apiService;

  MovieBloc(this.apiService) : super(MovieInitial()) {
    on<LoadNowPlayingMovies>(_onLoadNowPlayingMovies);
    on<LoadUpcomingMovies>(_onLoadUpcomingMovies);
    on<LoadPopularMovies>(_onLoadPopularMovies );
    on<LoadTopRatedMovies>(_onLoadTopRatedMovies);
    on<LoadAiringTodayTvShows>(_onLoadAiringTodayTvShows );
    on<LoadOnTheAirTvShows>(_onLoadOnTheAirTvShows);
    on<LoadPopularTvShows>(_onLoadPopularTvShows);
    on<LoadTopRatedTvShows>(_onLoadTopRatedTvShows);
  }

  Future<void> _onLoadNowPlayingMovies(LoadNowPlayingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getNowPlayingMovie();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void> _onLoadUpcomingMovies(LoadUpcomingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getUpcomingMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void>_onLoadPopularMovies (LoadPopularMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getPopularMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void>_onLoadTopRatedMovies (LoadTopRatedMoviesevent, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getTopRatedMovie();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void> _onLoadAiringTodayTvShows(LoadAiringTodayTvShows event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getPopularMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void> _onLoadOnTheAirTvShows(LoadOnTheAirTvShows event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getPopularMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void>_onLoadPopularTvShows(LoadPopularTvShows event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getPopularMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
  Future<void>_onLoadTopRatedTvShows (LoadTopRatedTvShows event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await apiService.getPopularMovies();
      emit(MovieLoaded(movies: movies.results));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
