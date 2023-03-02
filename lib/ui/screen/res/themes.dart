import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

final sightSliderTheme = SliderThemeData(
  activeTrackColor: PlacesColors.primaryButtonLight,
  inactiveTrackColor: PlacesColors.textSecondary2Opacity,
  thumbColor: Colors.white,
  trackHeight: 2,
  activeTickMarkColor: Colors.transparent,
  inactiveTickMarkColor: Colors.transparent,
);

/// светлая тема.. Боже, зачем этот комментарий, все же умеют читать на англицком )))
final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: PlacesColors.bgMainLight,
  backgroundColor: PlacesColors.tileBgLight,
  // Для себя - попробовал убрать ripple, не нравится
  // splashColor: Colors.transparent,
  // highlightColor: Colors.transparent,
  // Так же можно передавать кастомную splashFactory https://stackoverflow.com/a/54084137
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
  sliderTheme: sightSliderTheme,
  buttonColor: PlacesColors.primaryButtonLight,
  disabledColor: PlacesColors.tileBgLight,
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
  sliderTheme: sightSliderTheme,
  buttonColor: PlacesColors.primaryButtonDark,
  disabledColor: PlacesColors.tileBgDark,
);
