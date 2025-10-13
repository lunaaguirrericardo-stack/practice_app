import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:practice_app/widgets/exports_widgets.dart';

Widget pokemonMenu({
  required Size size,
  required bool basic,
  required bool stats,
  required bool abilities,
  required bool sprites,
  required void Function() onTapBasic,
  required void Function() onTapStats,
  required void Function() onTapAbilities,
  required void Function() onTapSprites,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: SizedBox(
      height: size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCard(
            elevation: 1,
            borderRadius: 10,
            borderWidth: .2,
            color: basic ? Colors.green.shade200 : Colors.white,
            width: basic ? size.width * 0.23 : size.width * 0.2,
            onTap: onTapBasic,
            child: Center(child: customText(text: 'Basic', fontWeight: FontWeight.bold))
          ),
          CustomCard(
            elevation: 1,
            borderRadius: 10,
            borderWidth: .2,
            color: stats ? Colors.green.shade200 : Colors.white,
            width: stats ? size.width * 0.23 : size.width * 0.2,
            onTap: onTapStats,
            child: Center(child: customText(text: 'Stats', fontWeight: FontWeight.bold))
          ),
          CustomCard(
            elevation: 1,
            borderRadius: 10,
            borderWidth: .2,
            color: abilities ? Colors.green.shade200 : Colors.white,
            width: abilities ? size.width * 0.23 : size.width * 0.2,
            onTap: onTapAbilities,
            child: Center(child: customText(text: 'Abilities', fontWeight: FontWeight.bold)),
          ),
          CustomCard(
            elevation: 1,
            borderRadius: 10,
            borderWidth: .2,
            color: sprites ? Colors.green.shade200 : Colors.white,
            width: sprites ? size.width * 0.23 : size.width * 0.2,
            onTap: onTapSprites,
            child: Center(child: customText(text: 'Sprites', fontWeight: FontWeight.bold)),
          ),
        ],
      )
    ),
  );
}