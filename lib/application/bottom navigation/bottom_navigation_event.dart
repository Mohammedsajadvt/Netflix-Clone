part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}


class Tabchange extends BottomNavigationEvent{
  const Tabchange({required this.tabIndex});
  final int tabIndex;
 
  @override
  List<Object> get props => [tabIndex];
}
