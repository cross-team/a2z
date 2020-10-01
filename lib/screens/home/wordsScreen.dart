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
            if (newData != null) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: newData.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (newData.length == index) {
                      Word addWord = Word('add', '', '', '');
                      return WordCard(word: addWord, getColor: widget.getColor);
                    }

                    Word wordModel = Word.fromJson(newData[index]);
                    return WordCard(word: wordModel, getColor: widget.getColor);
                  });
            }
          } else {
            var screenData = newData.where(
                (element) => element['name'][0] == widget.letter.toUpperCase());

            if (screenData != null) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: screenData.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (screenData.length == index) {
                      Word addWord = Word('add', '', '', '');
                      return WordCard(word: addWord, getColor: widget.getColor);
                    }

                    if (screenData.elementAt(index)['name'][0] ==
                        widget.letter.toUpperCase()) {
                      Word wordModel =
                          Word.fromJson(screenData.elementAt(index));
                      return WordCard(
                          word: wordModel, getColor: widget.getColor);
                    }
                  });
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
