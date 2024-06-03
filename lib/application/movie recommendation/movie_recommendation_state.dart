import 'package:equatable/equatable.dart';
import 'package:netflix/infrastructure/model/movie_recommendation.dart';

abstract class MovieRecommendationState extends Equatable {
  const MovieRecommendationState();

  @override
  List<Object?> get props => [];
}

class MovieRecommendationInitial extends MovieRecommendationState {}

class MovieRecommendationLoading extends MovieRecommendationState {}

class MovieRecommendationLoaded extends MovieRecommendationState {
  final MovieRecommendationsModel movieRecommendations;

  const MovieRecommendationLoaded(this.movieRecommendations);

  @override
  List<Object?> get props => [movieRecommendations];
}

class MovieRecommendationError extends MovieRecommendationState {
  final String message;

  const MovieRecommendationError(this.message);

  @override
  List<Object?> get props => [message];
}
