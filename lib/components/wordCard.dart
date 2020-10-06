import 'package:a2z/bloc/home_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a2z/models/word.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordCard extends StatefulWidget {
  final Word word;
  final Function getColor;
  WordCard({
    @required this.word,
    @required this.getColor,
  });

  @override
  _WordCardState createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url = 'https://criticalalphabet.com/suggest/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    // The top of the card, AKA the closed version of the card
    Widget cardTop = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: AutoSizeText(
          widget.word.name.toLowerCase(),
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto Slab',
              fontSize: 40.0,
              letterSpacing: -1.5),
          maxLines: 3,
          minFontSize: 40.0,
        )),
      ],
    );

    //The content for the word's definition
    Widget cardDefinition = Container(
      margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Text(
        widget.word.definition,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto Slab',
          fontSize: 16.0,
        ),
      ),
    );

    //The content for the word's question
    List<Widget> getQuestions(String questions) {
      if (questions.indexOf('?') == questions.lastIndexOf('?')) {
        return [
          Text(questions,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto Slab',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold))
        ];
      }
      List<String> splitQuestions = questions.split('? ');
      List<Widget> questionList = [];
      splitQuestions.forEach((element) {
        String text = element;
        if (!text.contains('?')) {
          text = element + '?';
        }
        if (text[0] == ' ') {
          text = text.substring(1);
        }
        questionList.add(Text(text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto Slab',
                fontSize: 18.0,
                fontWeight: FontWeight.bold)));
        if (splitQuestions[splitQuestions.length - 1] != element) {
          questionList.add(Container(
            height: 16.0,
          ));
        }
      });
      return questionList;
    }

    Widget cardQuestion = Container(
        width: 360.0,
        margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.getColor(widget.word.name[0], true),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getQuestions(widget.word.question),
        ));

    // Suggest Word Button
    if (widget.word.name == 'add') {
      return Semantics(
          child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
              height: 64.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                onPressed: _launchURL,
                color: Colors.white,
                elevation: 8.0,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: AutoSizeText(
                          'SUGGEST A WORD',
                          style: TextStyle(
                              fontSize: 18.0,
                              letterSpacing: -1.25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    )),
              )));
    }

    // margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0)

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeWords) {
        if (state.word == widget.word.name) {
          void closeCard(String currentLetter) {
            final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
            homeBloc.add(SetView('words', currentLetter, ''));
          }

          return Semantics(
              selected: true,
              child: Container(
                  margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {
                      closeCard(state.letter);
                    },
                    color: widget.getColor(widget.word.name[0]),
                    elevation: 2.0,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                        child: Column(
                            children: [cardTop, cardDefinition, cardQuestion])),
                  )));
        }

        void openCard(String currentLetter, String word) {
          final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
          homeBloc.add(SetView('words', currentLetter, word));
        }

        return Semantics(
            selected: false,
            child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {
                    openCard(state.letter, widget.word.name);
                  },
                  color: widget.getColor(widget.word.name[0]),
                  elevation: 2.0,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: cardTop),
                )));
      }
    });
  }
}
