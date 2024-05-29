part of 'tv_shows_bloc.dart';

sealed class TvShowsEvent extends Equatable {
  const TvShowsEvent();

  @override
  List<Object> get props => [];
}


class LoadAiringTodayTvShows extends TvShowsEvent {}
class LoadOnTheAirTvShows extends TvShowsEvent {}
class LoadPopularTvShows extends TvShowsEvent {}
class LoadTopRatedTvShows extends TvShowsEvent {}