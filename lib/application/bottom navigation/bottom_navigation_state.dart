part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState({required this.tabIndex});
  final int tabIndex;
  @override
  List<Object> get props => [tabIndex];
}

class BottomNavLoaded extends BottomNavigationState {
const BottomNavLoaded({required super.tabIndex});
}
