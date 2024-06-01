// movie_recommendation_event.dart
import 'package:equatable/equatable.dart';

abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieRecommendation extends MovieRecommendationEvent {
  final int movieId;

  const FetchMovieRecommendation(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
