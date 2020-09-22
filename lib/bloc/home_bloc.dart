import 'dart:async';

import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeBloc() : super(HomeLetters());

  static const List<String> alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is SetView) {
      switch (event.view) {
        case 'words':
          yield HomeWords(event.letter, '');
          break;
        case 'letters':
          yield HomeLetters();
          break;
        default:
      }
    }
    if (event is SelectWord) {
      yield HomeWords(event.word[0], event.word);
    }
    if (event is NextLetter) {
      if (event.currentLetter == 'z') {
      } else {
        yield HomeWords(
            alphabet[alphabet.indexOf(event.currentLetter) + 1], '');
      }
    }
    if (event is PrevLetter) {
      if (event.currentLetter == 'a') {
      } else {
        yield HomeWords(
            alphabet[alphabet.indexOf(event.currentLetter) - 1], '');
      }
    }
  }
}
