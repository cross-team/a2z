import 'package:a2z/components/heart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WordCard extends StatefulWidget {
  final String word;
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
    return RaisedButton(
      onPressed: () {},
      color: Color(0xFFFFFFFF),
      elevation: 2.0,
      child: Container(
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Heart(
                    isFilled: isFavorite,
                    color: widget.getColor(widget.word[0]),
                    onPressed: _toggleHeart,
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
                          child: AutoSizeText(
                            widget.word.toLowerCase(),
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40.0),
                          )))
                ],
              )),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
