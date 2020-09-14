import 'package:flutter/material.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({@required this.getColor});
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    return Text('Words Screen');
  }
}
