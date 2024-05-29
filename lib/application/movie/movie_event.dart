import 'package:equatable/equatable.dart';

class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadNowPlayingMovies extends MovieEvent {}
class LoadUpcomingMovies extends MovieEvent {}
class LoadPopularMovies extends MovieEvent {}
class LoadTopRatedMovies extends MovieEvent {}


