import 'package:flutter/material.dart';

class MenuOption {

  final String route;
  final String name;
  final String description;
  final Widget screen;
  final String imagePath;

  MenuOption({
    required this.route,
    required this.name,
    required this.description,
    required this.screen,
    required this.imagePath
    });

}