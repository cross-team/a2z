import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/brand.png'),
      // constraints: BoxConstraints(maxWidth: 200.0),
      padding: EdgeInsets.fromLTRB(100.0, 48.0, 100.0, 64.0),
    );
  }
}
