import 'package:flutter/material.dart';

//Siempre priorizar la creación de widgets sobre clases 
Widget customText({
  required String text,
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

