part of 'tv_shows_bloc.dart';

sealed class TvShowsState extends Equatable {
  const TvShowsState();
  
  @override
  List<Object> get props => [];
}

final class TvShowsInitial extends TvShowsState {}

class TvShowsLoading extends TvShowsState{}

class TvShowsLoaded extends TvShowsState{
  final List<Result> show;
  const TvShowsLoaded({required this.show});
}
class TvShowError extends TvShowsState {
  final String message;
  const TvShowError({required this.message});
}