import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text; // texto a mostrar
  final double fontSize; // tamaño de fuente
  final Color color; // color de texto
  final FontWeight fontWeight; // peso de fuente
  final TextAlign textAlign; // alineación

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
