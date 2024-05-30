part of 'search_bloc.dart';


abstract class SearchState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {

}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchModel searchResults;

  SearchLoaded(this.searchResults);
}

class PopularMoviesLoaded extends SearchState {
  final MovieModel popularMovies;

  PopularMoviesLoaded(this.popularMovies);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
