import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  Letter({@required this.letter, @required this.getColor});
  final String letter;
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: getColor(letter, true),
      splashColor: getColor(letter),
      child: Text(
        letter,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
      ),
      shape: CircleBorder(),
    );
  }
}
