part of 'search_bloc.dart';


abstract class SearchEvent  extends Equatable{
  @override

  List<Object?> get props => throw UnimplementedError();
}

class PerformSearch extends SearchEvent {
  final String query;

  PerformSearch(this.query);
}

class LoadPopularMoviesEvent extends SearchEvent {}
