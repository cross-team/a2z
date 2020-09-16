part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final String currentLetter;
  final String currentWord;
  HomeState({this.currentLetter, this.currentWord});
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          currentLetter: '',
          currentWord: '',
        );
}

class NewHomeState extends HomeState {
  NewHomeState.fromOldHomeState(HomeState oldState,
      {String currentLetter, String currentWord})
      : super(
            currentLetter: currentLetter ?? oldState.currentLetter,
            currentWord: currentWord ?? oldState.currentWord);
}
