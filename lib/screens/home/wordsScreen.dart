import 'package:a2z/components/logo.dart';
import 'package:flutter/material.dart';

class WordsScreen extends StatelessWidget {
  WordsScreen({@required this.getColor});
  final Function getColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Logo()],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
