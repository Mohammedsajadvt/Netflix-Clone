
import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieDetail extends MovieDetailEvent {
  final int movieId;

  const FetchMovieDetail(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
