import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  WordBloc() : super(WordInitial());

  @override
  Stream<WordState> mapEventToState(
    WordEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
