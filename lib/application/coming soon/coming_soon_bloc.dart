import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/coming%20soon/coming_soon_event.dart';
import 'package:netflix/application/coming%20soon/coming_soon_state.dart';
import '../../../infrastructure/service/api_service.dart';


class ComingSoonBloc extends Bloc<ComingSoonEvent, ComingSoonState> {
  final ApiServices apiServices;

  ComingSoonBloc(this.apiServices) : super(ComingSoonInitial()) {
    on<FetchComingSoonMovies>(_onFetchComingSoonMovies);
  }

  Future<void> _onFetchComingSoonMovies(FetchComingSoonMovies event, Emitter<ComingSoonState> emit) async {
    emit(ComingSoonLoading());
    try {
      final movies = await apiServices.getUpcomingMovies();
      emit(ComingSoonLoaded(movies));
    } catch (e) {
      emit(ComingSoonError(e.toString()));
    }
  }
}
