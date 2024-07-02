import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavLoaded(tabIndex: 0)) {
    on<Tabchange>((event, emit) {
   emit(BottomNavLoaded(tabIndex: event.tabIndex));
    });
  }
}
