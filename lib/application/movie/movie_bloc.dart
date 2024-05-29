import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/movie/movie_event.dart';
import 'package:netflix/application/movie/movie_state.dart';
import 'package:netflix/data/model/movie_model.dart';
import 'package:netflix/data/service/api_service.dart';



class BlocBloc extends Bloc<MovieEvent, MovieState> {
  BlocBloc() : super(MovieInitial()) {
    on<MovieEvent>(onLoadMovieHandler1);
    on<MovieEvent>(onLoadMovieHandler2);
    on<MovieEvent>(onLoadMovieHandler3);
    on<MovieEvent>(onLoadMovieHandler4);
    on<MovieEvent>(onLoadMovieHandler5);
    on<MovieEvent>(onLoadMovieHandler6);
    on<MovieEvent>(onLoadMovieHandler7);
    on<MovieEvent>(onLoadMovieHandler8);
  }
  onLoadMovieHandler1(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getNowPlayingMovie()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler2(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getUpcomingMovies()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler3(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getPopularMovies()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler4(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getTopRatedMovie()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler5(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getAiringToday()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler6(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getOnTheAir()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler7(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getPopular()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  onLoadMovieHandler8(event,emit)async{
  emit(MovieLoading());
  try{
    ApiServices apiservice = ApiServices();
     List<MovieModel> data = (await apiservice.getTopRated()) as List<MovieModel>;
    emit(MovieLoaded(movie: data));

  }catch(e){
    emit(MovieErro());
  } 
  }
  
}
