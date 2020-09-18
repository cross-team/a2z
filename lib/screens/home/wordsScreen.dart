import 'dart:async' show Future;
import 'dart:convert';
import 'package:a2z/components/logo.dart';
import 'package:a2z/components/wordCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class WordsScreen extends StatefulWidget {
  final Function getColor;
  WordsScreen({@required this.getColor});

  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  List data;

  @override
  Widget build(BuildContext context) {
    FutureBuilder wordCards = FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/words.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());

          if (newData != null) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: newData.length,
                itemBuilder: (BuildContext context, int index) {
                  print(newData[index]['name']);
                  return WordCard(
                      word: newData[index]['name'], getColor: widget.getColor);
                });
          }

          return Text('Loading');
        });

    return Column(
      children: [Logo(), Expanded(child: wordCards)],
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
