import 'package:flutter/material.dart';

class PlacesFonts {
  static TextStyle get _roboto {
    return TextStyle(
      fontFamily: 'Roboto',
    );
  }

  static TextStyle get size14 {
    return PlacesFonts._roboto.copyWith(
        fontSize: 14,
        height: 1.28,
    );
  }

  static TextStyle get size14_weightBold {
    return PlacesFonts.size14.copyWith(
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle get size16 {
    return PlacesFonts._roboto.copyWith(
        fontSize: 16,
        height: 1.25,
    );
  }

  static TextStyle get size24 {
    return PlacesFonts._roboto.copyWith(
      fontSize: 24,
      height: 1.25,
    );
  }

  static TextStyle get size24_weightBold {
    return PlacesFonts.size24.copyWith(
      fontWeight: FontWeight.bold
    );
  }
  
  static TextStyle get size16_weight500 {
    return PlacesFonts.size16.copyWith(
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle get size32 {
    return PlacesFonts._roboto.copyWith(
      fontSize: 32,
      height: 1.125, // line-height 36
    );
  }

  static TextStyle get size32_weightBold {
    return PlacesFonts.size32.copyWith(
      fontWeight: FontWeight.w700,
    );
  }
}