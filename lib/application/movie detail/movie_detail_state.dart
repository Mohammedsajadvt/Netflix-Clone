// movie_detail_state.dart
import 'package:equatable/equatable.dart';
import 'package:netflix/infrastructure/model/movie_details_model.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailModel movieDetail;

  const MovieDetailLoaded(this.movieDetail);

  @override
  List<Object?> get props => [movieDetail];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
