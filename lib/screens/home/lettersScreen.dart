import 'package:flutter/material.dart';

class LettersScreen extends StatelessWidget {
  LettersScreen({@required this.getColor});
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    return Text('Letters Screen');
  }
}
