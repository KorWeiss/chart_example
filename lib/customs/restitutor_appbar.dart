import 'package:chart_example_app/customs/style.dart';
import 'package:flutter/material.dart';

enum Sort { l, r, c }

restiApB({
  Color bgc = Colors.white,
  Text? text,
  String inputtext = 'title',
  Widget? leading,
  Sort align = Sort.l,
  TextStyle? textstyle,
  List<Widget>? actions,
}) {
  Widget titleWidget;
  switch (align) {
    case Sort.l:
      titleWidget = (Align(
        alignment: Alignment.centerLeft,
        child: Text(inputtext, style: textstyle ?? styleTS()),
      ));
      break;
    case Sort.r:
      titleWidget = (Align(
        alignment: Alignment.centerRight,
        child: Text(inputtext, style: textstyle ?? styleTS()),
      ));
    default:
      titleWidget = Text(inputtext, style: textstyle ?? styleTS());
      break;
  }

  return AppBar(
    backgroundColor: bgc,
    centerTitle: align == Sort.c,
    title: titleWidget,
    leading: leading,
    actions: actions,
  );
}
