import 'package:flutter/material.dart';

class MenuOption {

  final String route;
  final IconData icon;
  final String name;
  final String description;
  final Widget screen;

  MenuOption({
    required this.route,
    required this.icon,
    required this.name,
    required this.description,
    required this.screen
    });

}