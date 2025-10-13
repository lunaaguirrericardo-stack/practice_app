import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:practice_app/widgets/exports_widgets.dart';

Widget menuTile({
  required Size size,
  required String title,
  required String image,
  void Function()? onTap,
  required String subtitle,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    onTap: onTap,
    title: customText(fontSize: 18, text: title, fontWeight: FontWeight.bold),
    subtitle: customText(text: subtitle, fontSize: 13, color: Colors.grey[700]!),
    leading: CustomCard(
      elevation: 0,
      childPadding: 0,
      borderRadius: 10,
      width: size.width * .15,
      height: size.width * .15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover),
      )
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 25),
  );
}