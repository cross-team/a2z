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

    return Container(
        margin: EdgeInsets.all(4.0),
        child: RawMaterialButton(
          onPressed: _onItemPressed,
          elevation: 2.0,
          fillColor: getColor(letter),
          splashColor: getColor(letter),
          child: Text(
            letter,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          constraints: BoxConstraints.expand(width: 56.0, height: 56.0),
        ));
  }
}
