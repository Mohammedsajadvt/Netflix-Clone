import 'package:equatable/equatable.dart';

abstract class ComingSoonEvent extends Equatable {
  const ComingSoonEvent();

  @override
  List<Object> get props => [];
}

class FetchComingSoonMovies extends ComingSoonEvent {}
