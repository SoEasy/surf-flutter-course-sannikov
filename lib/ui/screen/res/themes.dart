import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: PlacesColors.bgMainLight,
  backgroundColor: PlacesColors.tileBgLight,

  textTheme: TextTheme(
    headline1: TextStyle(
      color: PlacesColors.textMainLight,
    ),
    bodyText1: TextStyle(
      color: PlacesColors.secondaryLight,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: PlacesColors.bgMainDark,
  backgroundColor: PlacesColors.tileBgDark,

  textTheme: TextTheme(
    headline1: TextStyle(
      color: PlacesColors.textMainDark,
    ),
    bodyText1: TextStyle(
      color: PlacesColors.secondaryDark,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: PlacesColors.bgMainDark,
  ),
);
