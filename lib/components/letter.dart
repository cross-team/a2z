import 'package:flutter/material.dart';
import 'package:a2z/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Letter extends StatelessWidget {
  Letter({@required this.letter, @required this.getColor});
  final String letter;
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    void _onItemPressed() {
      final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
      homeBloc.add(SetView('words', letter));
    }

    return RawMaterialButton(
      onPressed: _onItemPressed,
      elevation: 2.0,
      fillColor: getColor(letter, true),
      splashColor: getColor(letter),
      child: Text(
        letter,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints.expand(width: 50.0, height: 50.0),
    );
  }
}
