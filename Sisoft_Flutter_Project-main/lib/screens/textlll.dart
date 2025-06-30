import 'package:flutter/material.dart';

class Textlll extends StatelessWidget {
  Color ? c;
  Textlll(this.c, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: c),
    );
  }

  
}
