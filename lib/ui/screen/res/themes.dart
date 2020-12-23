import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

/// светлая тема.. Боже, зачем этот комментарий, все же умеют читать на англицком )))
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
    subtitle1: TextStyle(
      color: PlacesColors.textSecondary2,
    ),
    subtitle2: TextStyle(
      color: PlacesColors.textSecondary2.withOpacity(0.56),
    ),
  ),
);

/// темная тема
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
    subtitle1: TextStyle(
      color: PlacesColors.textSecondary2,
    ),
    subtitle2: TextStyle(
      color: PlacesColors.textSecondary2.withOpacity(0.56),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: PlacesColors.bgMainDark,
  ),
);
