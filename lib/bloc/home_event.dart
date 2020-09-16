part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ToggleView extends HomeEvent {}

class SelectLetter extends HomeEvent {}

class NextLetter extends HomeEvent {}

class PrevLetter extends HomeEvent {}
