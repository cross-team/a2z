import 'package:a2z/components/heart.dart';
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
                Row(
                  children: [
                    Heart(
                      isFilled: isFavorite,
                      color: widget.getColor(widget.word[0]),
                      onPressed: _toggleHeart,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
                        child: Text(
                          widget.word.toLowerCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40.0),
                        ))
                  ],
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ])),
    );
  }
}
