import 'package:equatable/equatable.dart';
import 'package:netflix/data/model/movie_model.dart';


abstract class MovieState extends Equatable{
  @override
  
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {
  
}

class MovieLoading extends MovieState{

}

class MovieLoaded extends MovieState{
List<MovieModel> movie;
MovieLoaded({required this.movie});
}

class MovieErro extends MovieState{

}

