part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class SetView extends HomeEvent {
  final String view;
  final String letter;
  const SetView(this.view, [this.letter]);
}

class SelectLetter extends HomeEvent {
  final String letter;
  const SelectLetter(this.letter);
}

class SelectWord extends HomeEvent {
  final String word;
  const SelectWord(this.word);
}

class NextLetter extends HomeEvent {
  final String currentLetter;
  const NextLetter(this.currentLetter);
}

class PrevLetter extends HomeEvent {
  final String currentLetter;
  const PrevLetter(this.currentLetter);
}
