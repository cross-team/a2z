import 'package:a2z/components/letter.dart';
import 'package:flutter/material.dart';

class LettersScreen extends StatelessWidget {
  LettersScreen({@required this.getColor});
  final Function getColor;
  final List<String> alphabet = [
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

  Widget getLetters(List<String> strings) {
    return new GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.all(36),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children:
            strings.map((a) => Letter(letter: a, getColor: getColor)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Expanded(child: getLetters(alphabet))]);
  }
}
