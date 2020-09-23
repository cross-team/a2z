import 'package:a2z/bloc/home_bloc.dart';
import 'package:a2z/components/heart.dart';
import 'package:a2z/models/word.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordCard extends StatefulWidget {
  final Word word;
  final Function getColor;
  WordCard({@required this.word, @required this.getColor});

  @override
  _WordCardState createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  bool isFavorite = false;

  void _toggleHeart() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('building card');
    // The top of the card, AKA the closed version of the card
    Widget cardTop = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: AutoSizeText(
          widget.word.name.toLowerCase(),
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        )),
        Heart(
          isFilled: isFavorite,
          color: widget.getColor(widget.word.name[0]),
          onPressed: _toggleHeart,
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );

    //The content for the word's definition
    Widget cardDefinition = Container(
      margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Text(
        widget.word.definition,
        style: TextStyle(
          fontFamily: 'Roboto Slab',
          fontSize: 12.0,
        ),
      ),
    );

    //The content for the word's question
    Widget cardQuestion = Container(
        margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: Text(widget.word.question,
            style: TextStyle(
                fontFamily: 'Roboto Slab',
                fontSize: 14.0,
                fontWeight: FontWeight.bold)));

    return Container(
        margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeWords) {
            if (state.word == widget.word.name) {
              void closeCard(String currentLetter) {
                final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
                homeBloc.add(SetView('words', currentLetter, ''));
              }

              return RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: () {
                  closeCard(state.letter);
                },
                color: Color(0xFFFFFFFF),
                elevation: 2.0,
                child:
                    Column(children: [cardTop, cardDefinition, cardQuestion]),
              );
            }

            void openCard(String currentLetter, String word) {
              final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
              homeBloc.add(SetView('words', currentLetter, word));
            }

            return RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              onPressed: () {
                openCard(state.letter, widget.word.name);
              },
              color: Color(0xFFFFFFFF),
              elevation: 2.0,
              child: Column(children: [cardTop]),
            );
          }
        }));
  }
}
