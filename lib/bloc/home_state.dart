part of 'home_bloc.dart';

abstract class HomeState {}

class HomeLetters extends HomeState {}

class HomeWords extends HomeState {
  final String letter;
  final String word;
  HomeWords(this.letter, this.word);
}
