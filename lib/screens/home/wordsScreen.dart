import 'dart:convert';
import 'package:a2z/bloc/home_bloc.dart';
import 'package:a2z/components/logo.dart';
import 'package:a2z/components/wordCard.dart';
import 'package:a2z/models/word.dart';
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
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/words.json'),
        builder: (context, snapshot) {
          List newData = json.decode(snapshot.data.toString());

          if (widget.letter == 'all') {
            List<Widget> allCardsList = [];

            for (var i = 0; i < newData.length + 1; i++) {
              if (newData.length == i) {
                Word addWord = Word('add', '', '', '');
                allCardsList
                    .add(WordCard(word: addWord, getColor: widget.getColor));
              } else {
                Word wordModel = Word.fromJson(newData[i]);
                allCardsList
                    .add(WordCard(word: wordModel, getColor: widget.getColor));
              }
            }

            if (newData != null) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: allCardsList,
                ),
              );
            }
          } else {
            var screenData = newData.where(
                (element) => element['name'][0] == widget.letter.toUpperCase());

            List<Widget> cardsList = [];

            for (var i = 0; i < screenData.length + 1; i++) {
              if (screenData.length == i) {
                Word addWord = Word('add', '', '', '');
                cardsList
                    .add(WordCard(word: addWord, getColor: widget.getColor));
              } else if (screenData.elementAt(i)['name'][0] ==
                  widget.letter.toUpperCase()) {
                Word wordModel = Word.fromJson(screenData.elementAt(i));
                cardsList
                    .add(WordCard(word: wordModel, getColor: widget.getColor));
              }
            }

            if (screenData != null) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: cardsList,
                ),
              );
            }
          }

          return Text('Loading');
        });

    Widget fadeContainer = Expanded(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
                  colors: <Color>[Colors.transparent, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment(0.0, -0.8))
              .createShader(bounds);
        },
        child: wordCards,
        blendMode: BlendMode.dstIn,
      ),
    );

    void swipe(details) {
      if (widget.letter != 'all') {
        final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
        if (details.primaryVelocity < 0) {
          homeBloc.add(NextLetter(widget.letter));
        }
        if (details.primaryVelocity > 0) {
          homeBloc.add(PrevLetter(widget.letter));
        }
      }
    }

    return GestureDetector(
        onHorizontalDragEnd: swipe,
        child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              children: [Logo(), fadeContainer],
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            )));
  }
}
