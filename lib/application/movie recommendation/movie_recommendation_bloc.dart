import 'package:bloc/bloc.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_event.dart';
import 'package:netflix/application/movie%20recommendation/movie_recommendation_state.dart';
import 'package:netflix/infrastructure/service/api_service.dart';


class MovieRecommendationBloc extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  MovieRecommendationBloc(ApiServices apiServices) : super(MovieRecommendationInitial()) {
    on<MovieRecommendationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
