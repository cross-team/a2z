import 'dart:convert';
import 'package:a2z/bloc/home_bloc.dart';
import 'package:a2z/components/logo.dart';
import 'package:a2z/components/wordCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class WordsScreen extends StatefulWidget {
  final String letter;
  final Function getColor;
  WordsScreen({@required this.getColor, @required this.letter});

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
          List newData = json.decode(snapshot.data.toString());
          var screenData = newData.where(
              (element) => element['name'][0] == widget.letter.toUpperCase());

          if (screenData != null) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: screenData.length,
                itemBuilder: (BuildContext context, int index) {
                  if (screenData.elementAt(index)['name'][0] ==
                      widget.letter.toUpperCase()) {
                    return WordCard(
                        word: screenData.elementAt(index)['name'],
                        getColor: widget.getColor);
                  }
                });
          }

          return Text('Loading');
        });

    void swipe(details) {
      final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
      if (details.primaryVelocity > 0) {
        homeBloc.add(NextLetter(widget.letter));
      }
      if (details.primaryVelocity < 0) {
        homeBloc.add(PrevLetter(widget.letter));
      }
    }

    return GestureDetector(
        onHorizontalDragEnd: swipe,
        child: Column(
          children: [Logo(), Expanded(child: wordCards)],
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        ));
  }
}
