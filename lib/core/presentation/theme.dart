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

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.white),
);

Decoration outlinedContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  border: Border.all(color: const Color(0xffff8200), width: 1),
  color: const Color(0x19ff8200),
);

Decoration plainContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
);

Color kTransparentGrey = const Color(0xffd3d3d3).withOpacity(0.15);

BoxDecoration kRoundedGreyDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10), color: kTransparentGrey);

BoxDecoration kRoundedWhiteDecoration =
    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white);

Decoration kOutlinedContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  border: Border.all(color: const Color(0xffff8200), width: 1),
  color: const Color(0x19ff8200),
);
Decoration kOutlinedGreyContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  border: Border.all(color: Colors.grey.withOpacity(0.9), width: 1),
  // color: Colors.white,
);

Decoration kPlainContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
);
