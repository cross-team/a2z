import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Logo for The Critical Alphabet, by Lesley-Ann Noel PHD',
        child: Container(
          child: SvgPicture.asset('assets/images/brand.svg'),
          // constraints: BoxConstraints(maxWidth: 200.0),
          padding: EdgeInsets.fromLTRB(100.0, 48.0, 100.0, 0.0),
        ));
  }
}
