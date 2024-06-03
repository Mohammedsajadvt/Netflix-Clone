import 'package:bloc/bloc.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_event.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_state.dart';
import 'package:netflix/infrastructure/service/api_service.dart';

class MovieRecommendationBloc extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  final ApiServices apiServices;

  MovieRecommendationBloc(this.apiServices) : super(MovieRecommendationInitial()) {
    on<FetchMovieRecommendation>((event, emit) async {
      try {
        final movieRecommendations = await apiServices.getMovieRecommendation(event.movieId);
        emit(MovieRecommendationLoaded(movieRecommendations));
      } catch (e) {
        emit(MovieRecommendationError('Failed to fetch movie recommendations: $e'));
      }
    });
  }
}
