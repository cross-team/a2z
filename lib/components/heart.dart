import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
  Heart(
      {@required this.isFilled,
      @required this.color,
      @required this.onPressed});
  final bool isFilled;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    if (isFilled) {
      return IconButton(
        icon: Icon(Icons.favorite),
        color: color,
        onPressed: onPressed,
      );
    }

    return IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: onPressed,
    );
  }
}
