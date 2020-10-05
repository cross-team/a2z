import 'package:a2z/components/logo.dart';
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
  ];

  List<Widget> getLetters() {
    List<Widget> row0 = [];
    for (var i = 0; i < 5; i++) {
      row0.add(Letter(letter: alphabet[i], getColor: getColor));
    }
    List<Widget> row1 = [];
    for (var i = 5; i < 10; i++) {
      row1.add(Letter(letter: alphabet[i], getColor: getColor));
    }
    List<Widget> row2 = [];
    for (var i = 10; i < 15; i++) {
      row2.add(Letter(letter: alphabet[i], getColor: getColor));
    }
    List<Widget> row3 = [];
    for (var i = 15; i < 20; i++) {
      row3.add(Letter(letter: alphabet[i], getColor: getColor));
    }
    List<Widget> row4 = [];
    for (var i = 20; i < 25; i++) {
      row4.add(Letter(letter: alphabet[i], getColor: getColor));
    }
    List<Widget> row5 = [Letter(letter: 'z', getColor: getColor)];

    List<Widget> rows = [
      Container(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0), child: Logo()),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: row0,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: row1,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: row2,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: row3,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: row4,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: row5,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      )),
    ];

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getLetters(),
      mainAxisSize: MainAxisSize.max,
    );
  }
}
