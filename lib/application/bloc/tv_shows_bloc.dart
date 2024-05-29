import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/infrastructure/model/tvseries_model.dart';
import 'package:netflix/infrastructure/service/api_service.dart';

part 'tv_shows_event.dart';
part 'tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final ApiServices  apiService = ApiServices();
  TvShowsBloc() : super(TvShowsInitial()) {
    on<LoadAiringTodayTvShows>(_onLoadAiringTodayTvShows );
    on<LoadOnTheAirTvShows>(_onLoadOnTheAirTvShows);
    on<LoadPopularTvShows>(_onLoadPopularTvShows);
    on<LoadTopRatedTvShows>(_onLoadTopRatedTvShows);
  }
  Future<void> _onLoadAiringTodayTvShows(LoadAiringTodayTvShows event, Emitter<TvShowsState> emit) async {
    emit(TvShowsLoading());
    try {
      final tv = await apiService.getAiringToday();
      emit(TvShowsLoaded(show: tv.results));
    } catch (e) {
      emit(TvShowError(message: e.toString()));
    }
  }
  Future<void> _onLoadOnTheAirTvShows(LoadOnTheAirTvShows event, Emitter<TvShowsState> emit) async {
    emit(TvShowsLoading());
    try {
      final tv = await apiService.getOnTheAir();
      emit(TvShowsLoaded(show: tv.results));
    } catch (e) {
      emit(TvShowError(message: e.toString()));
    }
  }
  Future<void>_onLoadPopularTvShows(LoadPopularTvShows event, Emitter<TvShowsState> emit) async {
    emit(TvShowsLoading());
    try {
      final movies = await apiService.getPopular();
      emit(TvShowsLoaded(show:  movies.results));
    } catch (e) {
      emit(TvShowError(message: e.toString()));
    }
  }
  Future<void>_onLoadTopRatedTvShows (LoadTopRatedTvShows event, Emitter<TvShowsState> emit) async {
    emit(TvShowsLoading());
    try {
      final tv = await apiService.getTopRated();
      emit(TvShowsLoaded(show: tv.results));
    } catch (e) {
      emit(TvShowError(message: e.toString()));
    }
  }
}


