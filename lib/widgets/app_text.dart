import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color color;
  final FontWeight? fontWeight;

  const AppText(
      {Key? key,
      required this.fontSize,
      required this.text,
      required this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
