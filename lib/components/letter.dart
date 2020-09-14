import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  Letter({@required this.letter, @required this.getColor});
  final String letter;
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    return Text('Letters Screen');
  }
}
