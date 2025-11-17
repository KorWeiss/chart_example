import 'package:flutter/material.dart';

Text textTS({required String text,
 TextStyle? textstyle,
 }) {
  return Text(text,
   style: textstyle ?? styleTS());
}

Text textBS({required String text,
 TextStyle? textstyle,
 }) {
  return Text(text,
   style: textstyle ?? styleBS());
}

TextStyle styleTS({
  Color? color = Colors.black,
  double? fontSize = 20,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}

TextStyle styleBS({
  Color? color = Colors.white,
  double? fontSize = 15,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
}
