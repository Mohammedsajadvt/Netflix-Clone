import 'package:equatable/equatable.dart';
import 'package:netflix/infrastructure/model/movie_model.dart';

abstract class ComingSoonState extends Equatable {
  const ComingSoonState();

  @override
  List<Object> get props => [];
}

class ComingSoonInitial extends ComingSoonState {}

class ComingSoonLoading extends ComingSoonState {}

class ComingSoonLoaded extends ComingSoonState {
  final MovieModel movies;

  const ComingSoonLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class ComingSoonError extends ComingSoonState {
  final String message;
  const ComingSoonError(this.message);
  @override
  List<Object> get props => [message];
}
