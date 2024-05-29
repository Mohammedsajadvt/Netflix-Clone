import 'package:equatable/equatable.dart';

import '../../data/model/movie_model.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class MovieLoaded extends MovieState {
  final List<Result> movies;
  MovieLoaded({required this.movies});
}
class MovieError extends MovieState {
  final String message;
  MovieError({required this.message});
}
