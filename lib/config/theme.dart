import 'package:flutter/material.dart';
import 'package:flutter_screwdriver/flutter_screwdriver.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  dividerColor: Colors.black12,
  colorScheme:
      ColorScheme.fromSwatch(primarySwatch: Colors.white.toMaterialColor())
          .copyWith(secondary: Colors.white),
);

final lightTheme = ThemeData(
  primaryColor: const Color(0xffFF5E00),
  brightness: Brightness.light,
  accentColor: const Color(0xffFF5E00),
  backgroundColor: const Color(0xFFE5E5E5),
  dividerColor: Colors.white54,
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const Color(0xffFF5E00).toMaterialColor())
      .copyWith(secondary: const Color(0xffFF5E00)),
);
