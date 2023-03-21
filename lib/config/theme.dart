import 'package:flutter/material.dart';
import 'package:flutter_screwdriver/flutter_screwdriver.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.white.toMaterialColor(),
    backgroundColor: Colors.black,
  ).copyWith(
    secondary: Colors.white,
  ),
);

final lightTheme = ThemeData(
  primaryColor: const Color(0xffFF5E00),
  brightness: Brightness.light,
  dividerColor: Colors.white54,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const Color(0xffFF5E00).toMaterialColor(),
  ).copyWith(
    secondary: const Color(0xffFF5E00),
  ),
);
