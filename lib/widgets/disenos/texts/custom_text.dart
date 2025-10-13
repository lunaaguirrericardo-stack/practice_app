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

Widget richText({
  required String text1,
  required String text2,
  Color? textColor1,
  Color? textColor2,
  double? textSize1,
  double? textSize2,
  FontWeight? fontWeight1,
  FontWeight? fontWeight2,
  TextAlign? textAlign,
}) {
  return RichText(
    textAlign: textAlign ?? TextAlign.justify,
    text: TextSpan(
      children: [
        TextSpan(
          text: text1,
          style: TextStyle(
            color: textColor1 ?? Colors.black,
            fontSize: textSize1,
            fontWeight: fontWeight1,
          ),
        ),
        TextSpan(
          text: text2,
          style: TextStyle(
            color: textColor2 ?? Colors.black,
            fontSize: textSize2,
            fontWeight: fontWeight2,
          ),
        ),
      ],
    ),
  );
}

